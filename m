Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC31CF03F
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 11:01:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F43A88165;
	Tue, 12 May 2020 09:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbhOdEl6qq8v; Tue, 12 May 2020 09:01:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 304C8881F4;
	Tue, 12 May 2020 09:01:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 124E0C088E;
	Tue, 12 May 2020 09:01:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CD9EC0178
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1930B20034
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juxZHgcr3Ehh for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 09:01:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by silver.osuosl.org (Postfix) with ESMTPS id 862E520028
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:13 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200512090112euoutp010b670042486b75bb1115a86b5d1ff7ff~OPFkhTfnM2628826288euoutp01J
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 09:01:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200512090112euoutp010b670042486b75bb1115a86b5d1ff7ff~OPFkhTfnM2628826288euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1589274072;
 bh=0z83gmhkMR5EjUdL8WkTGagsnSoPYyB1uYT7DziITiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mPDk7t5SgibWywiUsFWcydQNw0XSnuS1AwoF3ulby7YltlXrgzqhPYRDFTiBPmoK/
 WhGb9okdxkgF1TwXy3Aiyf+R+0INcM2D0K+Y9iBtj+XWUbwAsxV7FglXfHy+DMu8nu
 wuur7WhHFiHpqUwh9beFg1yNdIQqUbJkrwDv8Qx4=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20200512090111eucas1p1d2f1f924c455cf9e6c6251192d756f7c~OPFkNhphe2839628396eucas1p1x;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 49.57.61286.7D56ABE5; Tue, 12
 May 2020 10:01:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200512090111eucas1p2fd703addaa7975c16a1ea2d7807cc6a6~OPFj1X8hG2564425644eucas1p2H;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200512090111eusmtrp262b48d8946df141f3aa9b123835997e7~OPFj0mr330472504725eusmtrp2_;
 Tue, 12 May 2020 09:01:11 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-54-5eba65d7bb3f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B7.35.08375.7D56ABE5; Tue, 12
 May 2020 10:01:11 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200512090110eusmtip12862a978e3691fd69c2bdc6b89a93d75~OPFjPYCFu1283712837eusmtip1h;
 Tue, 12 May 2020 09:01:10 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/38] drm: amdgpu: fix common struct sg_table related
 issues
Date: Tue, 12 May 2020 11:00:27 +0200
Message-Id: <20200512090058.14910-7-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200512090058.14910-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SV0xTYRj17+1tL4XWSyHhDxCFJiBiZOnDTUCiCYn3wQfHg4mJYJHLkFHs
 ZRoJm5AihhVFMECwyhahCAKR0QCFiICFMMsKw0gsIsugDGlvRd7OOd/5Zj4MEc6gllhQWAQl
 DROHiDg8dmPPzuD5MarF2yWz0IHIHOhjEc80rSjxujaRS9Tl16KEdvaQHjRmI8TI1g8OUVHV
 zSJK2t2JzZF5FlG/MIoSwy0vOURN1zSX6FxbRC8LyFT1HoesLqoG5MftEjbZtD2HkrMZKhap
 kMeTU/sLCJk7XgbI1okEDvm0oRKQG/Wnrhvf4Xn4USFBUZTU2fMeL1A7WcoO73CIyXzVChLA
 T1sZwDCIX4T9W5gM8DAhXg6g5vsWypBNALtqpwxkA8DirjS2DBjpM6pHK1lMoAzApKVc7lGK
 emqFpXNxcFco08o4OmyOpwLYm2miMyG4HIFyTZu+lBl+E64mKYAOs3E7uDqt1Ot8/BIc+jMC
 mHanYdW7DkSHjXBPOFu8a/CYwr4Xi3qMHHqS3xcijH+PC/vXzjDYC66XKAx1zOCKqoHLYGt4
 0FysXwHiyQDOD9RwGfIEwOGkfEOGO9QM/ObozoTgZ2FtizMjX4FpnzPYzPUEcFxryswggDmN
 zxFG5sP0NCHjtocFqrdHbTuH1IYxSZjz6w2aBWwLjm1TcGybgv99SwBSCSyoSDo0gKJdw6ho
 J1ocSkeGBTjdl4TWg8Ov+7SvWv8AttS+SoBjQGTCT3dr9hai4ig6NlQJIIaIzPkpQYcS308c
 +4iSSnykkSEUrQRWGFtkwb9Q+u2uEA8QR1DBFBVOSf9FWZiRZQJwvt3hVefPjR6sd7RfW8qz
 f2iVbOzrD+LjIiSL7baPzzUlNsndyOXIk9VR21nlFc797SmK5OBluV93Y4ad/6seYXALq03x
 tTdwZ+bLRF6H7a0Aa5nAxkN9w+dB9olEuwo3K95khOCaNlXiIgFFNnu8ReXY3FWv3Zg4Ryld
 FKsRselAsasjIqXFfwFcNyBYcQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xu7rXU3fFGUx/zmvRe+4kk8W0O7tZ
 LZaub2S32DhjPavF2/tA7v9tE5ktrnx9z2axcvVRJosF+60tvlx5yGSx6fE1VovLu+awWaw9
 cpfd4uCHJ6wOfB6tl/6yeayZt4bRY++3BSwe2789YPW4332cyWPzknqP2/8eM3tMvrGc0WP3
 zQY2j74tqxg9Pm+SC+CO0rMpyi8tSVXIyC8usVWKNrQw0jO0tNAzMrHUMzQ2j7UyMlXSt7NJ
 Sc3JLEst0rdL0Mt4e2sRS8EBjYrexbsZGxg/KnYxcnJICJhIrLm2iqmLkYtDSGApo8T95e0s
 EAkZiZPTGlghbGGJP9e62CCKPjFKfD8yD6yITcBQoustREJEoJNRYlr3R3YQh1lgDbPEve/L
 2UGqhAUCJN61dDKD2CwCqhLv7h4C6+YVsJW48PsKI8QKeYnVGw6A1XAK2Encn/8HrEZIoFDi
 0dW3UPWCEidnPgGyOYAWqEusnycEEmYGam3eOpt5AqPgLCRVsxCqZiGpWsDIvIpRJLW0ODc9
 t9hQrzgxt7g0L10vOT93EyMwhrcd+7l5B+OljcGHGAU4GJV4eDuMdsYJsSaWFVfmHmKU4GBW
 EuFtyQQK8aYkVlalFuXHF5XmpBYfYjQFem0is5Rocj4wveSVxBuaGppbWBqaG5sbm1koifN2
 CByMERJITyxJzU5NLUgtgulj4uCUamDkXvY0YPvmw33JGqt9p0s9kvu6WnHhnDfhczKX1EwR
 usLb9u5407oz74yCrj2Tdz4z71rTDCcVOcdzsrMajnOtSt2+nVv1WP+aLy9a3ym2772dcHLl
 y93KYlMTEy9L3+g58y5BIH3N67JN/JvP7Hi05kJbf92rvSt0PlQt2Kr5JIl7hWSL+/3uY0os
 xRmJhlrMRcWJAMozZl73AgAA
X-CMS-MailID: 20200512090111eucas1p2fd703addaa7975c16a1ea2d7807cc6a6
X-Msg-Generator: CA
X-RootMTR: 20200512090111eucas1p2fd703addaa7975c16a1ea2d7807cc6a6
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200512090111eucas1p2fd703addaa7975c16a1ea2d7807cc6a6
References: <20200512085710.14688-1-m.szyprowski@samsung.com>
 <20200512090058.14910-1-m.szyprowski@samsung.com>
 <CGME20200512090111eucas1p2fd703addaa7975c16a1ea2d7807cc6a6@eucas1p2.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

VGhlIERvY3VtZW50YXRpb24vRE1BLUFQSS1IT1dUTy50eHQgc3RhdGVzIHRoYXQgdGhlIGRtYV9t
YXBfc2coKSBmdW5jdGlvbgpyZXR1cm5zIHRoZSBudW1iZXIgb2YgdGhlIGNyZWF0ZWQgZW50cmll
cyBpbiB0aGUgRE1BIGFkZHJlc3Mgc3BhY2UuCkhvd2V2ZXIgdGhlIHN1YnNlcXVlbnQgY2FsbHMg
dG8gdGhlIGRtYV9zeW5jX3NnX2Zvcl97ZGV2aWNlLGNwdX0oKSBhbmQKZG1hX3VubWFwX3NnIG11
c3QgYmUgY2FsbGVkIHdpdGggdGhlIG9yaWdpbmFsIG51bWJlciBvZiB0aGUgZW50cmllcwpwYXNz
ZWQgdG8gdGhlIGRtYV9tYXBfc2coKS4KCnN0cnVjdCBzZ190YWJsZSBpcyBhIGNvbW1vbiBzdHJ1
Y3R1cmUgdXNlZCBmb3IgZGVzY3JpYmluZyBhIG5vbi1jb250aWd1b3VzCm1lbW9yeSBidWZmZXIs
IHVzZWQgY29tbW9ubHkgaW4gdGhlIERSTSBhbmQgZ3JhcGhpY3Mgc3Vic3lzdGVtcy4gSXQKY29u
c2lzdHMgb2YgYSBzY2F0dGVybGlzdCB3aXRoIG1lbW9yeSBwYWdlcyBhbmQgRE1BIGFkZHJlc3Nl
cyAoc2dsIGVudHJ5KSwKYXMgd2VsbCBhcyB0aGUgbnVtYmVyIG9mIHNjYXR0ZXJsaXN0IGVudHJp
ZXM6IENQVSBwYWdlcyAob3JpZ19uZW50cyBlbnRyeSkKYW5kIERNQSBtYXBwZWQgcGFnZXMgKG5l
bnRzIGVudHJ5KS4KCkl0IHR1cm5lZCBvdXQgdGhhdCBpdCB3YXMgYSBjb21tb24gbWlzdGFrZSB0
byBtaXN1c2UgbmVudHMgYW5kIG9yaWdfbmVudHMKZW50cmllcywgY2FsbGluZyBETUEtbWFwcGlu
ZyBmdW5jdGlvbnMgd2l0aCBhIHdyb25nIG51bWJlciBvZiBlbnRyaWVzIG9yCmlnbm9yaW5nIHRo
ZSBudW1iZXIgb2YgbWFwcGVkIGVudHJpZXMgcmV0dXJuZWQgYnkgdGhlIGRtYV9tYXBfc2coKQpm
dW5jdGlvbi4KClRvIGF2b2lkIHN1Y2ggaXNzdWVzLCBsZXRzIHVzZSBhIGNvbW1vbiBkbWEtbWFw
cGluZyB3cmFwcGVycyBvcGVyYXRpbmcKZGlyZWN0bHkgb24gdGhlIHN0cnVjdCBzZ190YWJsZSBv
YmplY3RzIGFuZCB1c2Ugc2NhdHRlcmxpc3QgcGFnZQppdGVyYXRvcnMgd2hlcmUgcG9zc2libGUu
IFRoaXMsIGFsbW9zdCBhbHdheXMsIGhpZGVzIHJlZmVyZW5jZXMgdG8gdGhlCm5lbnRzIGFuZCBv
cmlnX25lbnRzIGVudHJpZXMsIG1ha2luZyB0aGUgY29kZSByb2J1c3QsIGVhc2llciB0byBmb2xs
b3cKYW5kIGNvcHkvcGFzdGUgc2FmZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIFN6eXByb3dza2kg
PG0uc3p5cHJvd3NraUBzYW1zdW5nLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCkZvciBtb3JlIGluZm9ybWF0aW9uLCBzZWUg
J1tQQVRDSCB2NCAwMC8zOF0gRFJNOiBmaXggc3RydWN0IHNnX3RhYmxlIG5lbnRzCnZzLiBvcmln
X25lbnRzIG1pc3VzZScgdGhyZWFkOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwv
MjAyMDA1MTIwODU3MTAuMTQ2ODgtMS1tLnN6eXByb3dza2lAc2Ftc3VuZy5jb20vVC8KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jICB8IDYgKysrLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgICAgICB8IDkgKysrLS0tLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYyB8IDggKysrKy0t
LS0KIDMgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKaW5kZXggNDNkOGVk
Ny4uNTE5Y2U0NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RtYV9idWYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCkBAIC0zMDcsOCArMzA3LDggQEAgc3RhdGljIHN0cnVjdCBzZ190YWJsZSAqYW1kZ3B1X2Rt
YV9idWZfbWFwKHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIAkJaWYgKElTX0VS
UihzZ3QpKQogCQkJcmV0dXJuIHNndDsKIAotCQlpZiAoIWRtYV9tYXBfc2dfYXR0cnMoYXR0YWNo
LT5kZXYsIHNndC0+c2dsLCBzZ3QtPm5lbnRzLCBkaXIsCi0JCQkJICAgICAgRE1BX0FUVFJfU0tJ
UF9DUFVfU1lOQykpCisJCWlmIChkbWFfbWFwX3NndGFibGUoYXR0YWNoLT5kZXYsIHNndCwgZGly
LAorCQkJCSAgICBETUFfQVRUUl9TS0lQX0NQVV9TWU5DKSkKIAkJCWdvdG8gZXJyb3JfZnJlZTsK
IAkJYnJlYWs7CiAKQEAgLTM0OSw3ICszNDksNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfZG1hX2J1
Zl91bm1hcChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCiAJc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYoYm8tPnRiby5iZGV2KTsKIAogCWlmIChz
Z3QtPnNnbC0+cGFnZV9saW5rKSB7Ci0JCWRtYV91bm1hcF9zZyhhdHRhY2gtPmRldiwgc2d0LT5z
Z2wsIHNndC0+bmVudHMsIGRpcik7CisJCWRtYV91bm1hcF9zZ3RhYmxlKGF0dGFjaC0+ZGV2LCBz
Z3QsIGRpciwgMCk7CiAJCXNnX2ZyZWVfdGFibGUoc2d0KTsKIAkJa2ZyZWUoc2d0KTsKIAl9IGVs
c2UgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4IDljYmVjZDUu
LjU3YTVkNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKQEAgLTEw
MjQsNyArMTAyNCw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9waW5fdXNlcnB0cihzdHJ1
Y3QgdHRtX3R0ICp0dG0pCiB7CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVf
dHRtX2FkZXYodHRtLT5iZGV2KTsKIAlzdHJ1Y3QgYW1kZ3B1X3R0bV90dCAqZ3R0ID0gKHZvaWQg
Kil0dG07Ci0JdW5zaWduZWQgbmVudHM7CiAJaW50IHI7CiAKIAlpbnQgd3JpdGUgPSAhKGd0dC0+
dXNlcmZsYWdzICYgQU1ER1BVX0dFTV9VU0VSUFRSX1JFQURPTkxZKTsKQEAgLTEwMzksOSArMTAz
OCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9waW5fdXNlcnB0cihzdHJ1Y3QgdHRtX3R0
ICp0dG0pCiAJCWdvdG8gcmVsZWFzZV9zZzsKIAogCS8qIE1hcCBTRyB0byBkZXZpY2UgKi8KLQly
ID0gLUVOT01FTTsKLQluZW50cyA9IGRtYV9tYXBfc2coYWRldi0+ZGV2LCB0dG0tPnNnLT5zZ2ws
IHR0bS0+c2ctPm5lbnRzLCBkaXJlY3Rpb24pOwotCWlmIChuZW50cyA9PSAwKQorCXIgPSBkbWFf
bWFwX3NndGFibGUoYWRldi0+ZGV2LCB0dG0tPnNnLCBkaXJlY3Rpb24sIDApOworCWlmIChyKQog
CQlnb3RvIHJlbGVhc2Vfc2c7CiAKIAkvKiBjb252ZXJ0IFNHIHRvIGxpbmVhciBhcnJheSBvZiBw
YWdlcyBhbmQgZG1hIGFkZHJlc3NlcyAqLwpAQCAtMTA3Miw4ICsxMDcwLDcgQEAgc3RhdGljIHZv
aWQgYW1kZ3B1X3R0bV90dF91bnBpbl91c2VycHRyKHN0cnVjdCB0dG1fdHQgKnR0bSkKIAkJcmV0
dXJuOwogCiAJLyogdW5tYXAgdGhlIHBhZ2VzIG1hcHBlZCB0byB0aGUgZGV2aWNlICovCi0JZG1h
X3VubWFwX3NnKGFkZXYtPmRldiwgdHRtLT5zZy0+c2dsLCB0dG0tPnNnLT5uZW50cywgZGlyZWN0
aW9uKTsKLQorCWRtYV91bm1hcF9zZ3RhYmxlKGFkZXYtPmRldiwgdHRtLT5zZywgZGlyZWN0aW9u
LCAwKTsKIAlzZ19mcmVlX3RhYmxlKHR0bS0+c2cpOwogCiAjaWYgSVNfRU5BQkxFRChDT05GSUdf
RFJNX0FNREdQVV9VU0VSUFRSKQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
dnJhbV9tZ3IuYwppbmRleCBkMzk5ZTU4Li43NTQ5NWE3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuYwpAQCAtNDc3LDExICs0NzcsMTEgQEAgaW50IGFt
ZGdwdV92cmFtX21ncl9hbGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJaWYg
KHIpCiAJCWdvdG8gZXJyb3JfZnJlZTsKIAotCWZvcl9lYWNoX3NnKCgqc2d0KS0+c2dsLCBzZywg
bnVtX2VudHJpZXMsIGkpCisJZm9yX2VhY2hfc2d0YWJsZV9zZygqc2d0LCBzZywgaSkKIAkJc2ct
Pmxlbmd0aCA9IDA7CiAKIAlub2RlID0gbWVtLT5tbV9ub2RlOwotCWZvcl9lYWNoX3NnKCgqc2d0
KS0+c2dsLCBzZywgbnVtX2VudHJpZXMsIGkpIHsKKwlmb3JfZWFjaF9zZ3RhYmxlX3NnKCpzZ3Qs
IHNnLCBpKSB7CiAJCXBoeXNfYWRkcl90IHBoeXMgPSAobm9kZS0+c3RhcnQgPDwgUEFHRV9TSElG
VCkgKwogCQkJYWRldi0+Z21jLmFwZXJfYmFzZTsKIAkJc2l6ZV90IHNpemUgPSBub2RlLT5zaXpl
IDw8IFBBR0VfU0hJRlQ7CkBAIC01MDEsNyArNTAxLDcgQEAgaW50IGFtZGdwdV92cmFtX21ncl9h
bGxvY19zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJcmV0dXJuIDA7CiAKIGVycm9y
X3VubWFwOgotCWZvcl9lYWNoX3NnKCgqc2d0KS0+c2dsLCBzZywgbnVtX2VudHJpZXMsIGkpIHsK
Kwlmb3JfZWFjaF9zZ3RhYmxlX3NnKCpzZ3QsIHNnLCBpKSB7CiAJCWlmICghc2ctPmxlbmd0aCkK
IAkJCWNvbnRpbnVlOwogCkBAIC01MzIsNyArNTMyLDcgQEAgdm9pZCBhbWRncHVfdnJhbV9tZ3Jf
ZnJlZV9zZ3Qoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJc3RydWN0IHNjYXR0ZXJsaXN0
ICpzZzsKIAlpbnQgaTsKIAotCWZvcl9lYWNoX3NnKHNndC0+c2dsLCBzZywgc2d0LT5uZW50cywg
aSkKKwlmb3JfZWFjaF9zZ3RhYmxlX3NnKHNndCwgc2csIGkpCiAJCWRtYV91bm1hcF9yZXNvdXJj
ZShkZXYsIHNnLT5kbWFfYWRkcmVzcywKIAkJCQkgICBzZy0+bGVuZ3RoLCBkaXIsCiAJCQkJICAg
RE1BX0FUVFJfU0tJUF9DUFVfU1lOQyk7Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUgbWFpbGluZyBsaXN0CmlvbW11QGxpc3Rz
LmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lvbW11
