# show databases;
use ddive_test;
# show variables like 'c%';
# ALTER DATABASE `ddive_test` CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

# 게시판 테이블
drop table if exists `d_commu`;
create table d_commu (
	# 게시판 번호
	commuID			int unsigned		not null	auto_increment,
    # 게시판 이름
    commuName		varchar(50)			not null,
    # 게시판 유형
    category		enum ('전체', '영화', '드라마', '기타')		not null,
    constraint d_commu_pk primary key(commuID)
);

# 게시글 테이블
drop table if exists `d_board`;
create table d_board (
    # 게시글 번호 (자동 1증가)
	boardID			int unsigned 		not null	auto_increment,
    # 속한 게시판 번호 (전체, 특정 영화, 특정 드라마 ...)
	commuID			int	unsigned 		not null,
    # 게시글 유형
    tag				enum ('공지','잡담','정보','사진/짤','기타')	not null default '잡담',
    # 제목
	title			varchar(50)			not null,
    # 내용
	content			mediumtext			not null,
    # 작성자 (익명X)
	writer			varchar(10)			not null,
    # 작성 일자
	regDate			timestamp			not null default now(),
    # 조회수
	viewCnt			int	unsigned		not null default 0,
    # 공감수
	likeCnt			int	unsigned		not null default 0,
    # 첨부이미지수
	attachCnt		int	unsigned		not null default 0,
    # 댓글수
	commentCnt		int	unsigned		not null default 0,
    # 신고수
    reportbadCnt	int	unsigned		not null default 0,
    # 게시글 번호가 기준점
	constraint d_bno_pk primary key(boardID),
	constraint d_board_cno_fk foreign key(commuID) references d_commu(commuID)
);

# 게시판 첨부이미지
drop table if exists `d_attach`;
create table d_attach (
	# 게시글 번호
	boardID			int unsigned		not null,
    # 첨부파일 번호
    attachNum		int	unsigned		not null,
    # 첨부파일 이름
    imgName			varchar(260)		not null,
    # 첨부파일 크기
    imgSize			int unsigned		not null,
    # 첨부파일 (이미지, txt 등)
    attachImg		mediumblob			not null,
    # line이 0이면 첨부표시에만 띄우고,
    # 0이 아니라면 해당 라인에도 첨부파일을 띄운다.
    # ex : 게시글 5번째 라인에 첨부된 이미지를 띄움.
    imgline			int unsigned		not null default 0,
	constraint d_attach_pk primary key(boardID, attachNum),
    constraint d_attach_bno_fk foreign key(boardID) references d_board(boardID)
);

# 게시판 댓글 (이미지/짤은 최대 1개 첨부 가능)
drop table if exists `d_comment`;
create table d_comment (
	# 게시글 번호
	boardID			int unsigned		not null,
    # 댓글 번호
    commentID		int	unsigned		not null	auto_increment,
    # 부모 댓글 번호 (null이면 대댓글이 아닌거임)
    parentID		int unsigned		default null,
    # 댓글 순번
    commentOrder	int unsigned		not null,
    # 작성자 (익명X)
	writer			varchar(30)			not null,
    # 작성 일자
	regDate			timestamp			not null default now(),
    # 공감수
	likeCnt			int	unsigned		not null default 0,
    # 신고수
    reportbadCnt	int	unsigned		not null default 0,
    # 유형
	category		enum('text', 'img', 'textimg')		not null,
    # 내용
	content			text				default null,
    # 첨부파일 이름
    imgName			varchar(260)		default null,
    # 첨부파일 크기
    imgSize			int unsigned		default null,
    # 첨부파일 (이미지, 짤 등)
    attachImg		mediumblob			default null,
	constraint d_comment_pk primary key(commentID),
    constraint d_comment_bno_fk foreign key(boardID) references d_board(boardID),
    constraint d_parentID_fk foreign key(parentID) references d_comment(commentID)
);