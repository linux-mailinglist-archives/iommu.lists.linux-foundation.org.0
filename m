Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C5E35DA6
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 15:18:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 55576BB3;
	Wed,  5 Jun 2019 13:18:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D1AD27A9
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 13:18:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
	[210.118.77.12])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 184F86D6
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 13:18:16 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
	20190605131814euoutp02b8b66707b3326bc5f22fff65e7b05862~lT_W9lRqR2279722797euoutp02f
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 13:18:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
	20190605131814euoutp02b8b66707b3326bc5f22fff65e7b05862~lT_W9lRqR2279722797euoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1559740694;
	bh=AYgGHyFLe4+lbCQJ2TaAOGNr2vbCK28Y5rFRviVnQ8M=;
	h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
	b=uyqHfSGdFc8erg0mIwwOTF+h3YJYFD6/Z11/HBHjLeWQgRaeGa0r9A7rPUhmCuiqa
	iJX3aq2I75uuJTqcQcVoajjoh7Z+Sl+OdsfdMVACajjPMeN3rTy6kp7uRObT8YVmjX
	l6/dLvKP/mKKDxYXBCF8HISXZ2405Ewxc1bs9xvk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20190605131813eucas1p1ed5cf422671c87b4bc112e933d37ca16~lT_WCdiJ-0581705817eucas1p16;
	Wed,  5 Jun 2019 13:18:13 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 83.B2.04325.411C7FC5;
	Wed,  5 Jun 2019 14:18:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20190605131812eucas1p1e6c2c4df2433c5c763e024f03d3a99fb~lT_VKq1yj1563815638eucas1p1C;
	Wed,  5 Jun 2019 13:18:12 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20190605131812eusmtrp1b1b9a45609459ca8f477b0a5ba7099c9~lT_VJ5_ge2668526685eusmtrp1Y;
	Wed,  5 Jun 2019 13:18:12 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-a9-5cf7c1148657
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id FA.1E.04146.411C7FC5;
	Wed,  5 Jun 2019 14:18:12 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20190605131811eusmtip2934ac5ed190b3bb1a4d529c8f9db974b~lT_UT1Xq10341403414eusmtip2F;
	Wed,  5 Jun 2019 13:18:11 +0000 (GMT)
Subject: Re: [Freedreno] [PATCH] of/device: add blacklist for iommu dma_ops
To: Rob Clark <robdclark@gmail.com>, Tomasz Figa <tfiga@chromium.org>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <95d6e963-7f30-1d9c-99d7-0f6cc1589997@samsung.com>
Date: Wed, 5 Jun 2019 15:18:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRj22zk7O7MWn0fNN4uiVdLdpKSPNDEoOGY/ukCFCbbyoJKX2NKs
	iExR0rQyQ920pgWZt1YzvKdtWlNiYpmg1Uhh0IUkbV4KLHM7Vv57vvd5Hp73eflYipuR+rJx
	iWcEdaIqXsm40/UvfvZs8jJNRW7pKvIneT3dEjJTn08RfWePlFjvmxjyZuIbQ0o/WhHRfp1h
	SGX1cwkpaw8i+e1WGelrLmXIx/IfFMl82ikjplG7lNgezWodmb8Z0vWzkSKfx7roUI6vuVOD
	+JK0VzTfdy1Pwj+dLKP5Jp1Nxhurshm+YXJIyn+4apHwBQMViG8ZTGN4h3H5/gUR7sHRQnxc
	iqD2DznuHtuSZ6VO1zGpb3MNKA3ppDlIzgLeBjP36qgc5M5y+AGCaocOOQkOjyNor4sSCQeC
	+mcm9Nfx6UPHnKgCgeHWMVE0gqDkvZ5xEp44HDILymVO7IX3wHS6wxVB4Xwp9Ff+oJ0EgwMg
	ZyTHZVDgEHg/VUE5MY1Xw2CW1pXgjSNhor2fEjUe0K21u7xyfACqMsZcmMIroGGklBKxD7y1
	6yXOMMC1LLTatJS49m6wDRXNYU/4YnkiE/EyeFmQS4uGDATDPbUy8ZGLoC+9eK50EHRYXs2e
	jJ2NWAeGZn9xvAuayu+6xoAXwcCIh7jEIrhZ78xyjhVwJYsT1X6gszz8F2vqfU3dQErdvGq6
	eXV08+ro/ueWIboK+QjJmoQYQbM1UTi7WaNK0CQnxmw+mZRgRLPf8uVvy0Qjaps+YUaYRcqF
	Cng8FclJVSmacwlmBCyl9FKo3o1Hcopo1bnzgjopSp0cL2jMaClLK30UF9yGjnE4RnVGOCUI
	pwX1X1bCyn3TEPgcpC7vxv3Nay9ef2JcFfYr+rP90BLfFvMb63ARP6zcG5W5cUOTn8XmW9RL
	WkezD3JtoQET2Hw08HC1d9zKDnvhqnAyGS5f7Pb8iFxSM46lqM1/entonH6nMBbYmGxYYji7
	L2aNVl/o1rnjdmWx8pJQHBaRamwr0H4P5j3PK2lNrCpgPaXWqP4A4XKo3ZIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsVy+t/xe7oiB7/HGNw7yG7Re+4kk8X/bROZ
	LeYfOcdqcXbZQTaLK1/fs1nMeX6W0WLmm/9sFitXH2WyWLDf2mLi/rPsFpd3zWGzeL7wB7NF
	694j7BYHPzxhtbi7Aaj2c+s/NosTP3cwW7z8eILFQchjzbw1jB6zGy6yeFzu62Xy2PttAYvH
	zll32T02repk89j+7QGrx/3u40wek28sZ/TYfbOBzePzJrkA7ig9m6L80pJUhYz84hJbpWhD
	CyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jN29Z5kLNrNV3OpZz9jAOIu1i5GT
	Q0LAROLF/cOMXYxcHEICSxkl7p+fxgKRkJE4Oa0BqkhY4s+1LjaIoteMEm/XvWUHSQgLeEu0
	Tl4IZosIuEr8afrMDFLELDCZVWL2qtesEB1/WSTunLkGNopNwFCi6y3IKE4OXgE7iTvflzOD
	2CwCKhI322YygtiiAjESfY0rWCBqBCVOznwCZnMKBEqsav4IZjMLmEnM2/yQGcKWl9j+dg6U
	LS5x68l8pgmMQrOQtM9C0jILScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBCaI
	bcd+bt7BeGlj8CFGAQ5GJR5eiY3fY4RYE8uKK3MPMUpwMCuJ8Cbe/hIjxJuSWFmVWpQfX1Sa
	k1p8iNEU6LmJzFKiyfnA5JVXEm9oamhuYWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaP
	iYNTqoFRdoL225DM3ZPDwrleBonmn18YriV6ptaow9b8nV6Y/uMV8TKhjveOV3zQ3/bFecG9
	5A02h02u39rLkfwv5ga7I3/aiccf3Mo3M15m6w/afjDI4WNqS/KG+eHHTc0aS9dmpal6l2UH
	Xddf6Fa5sCtp5sa7TsJRka5nrY/94nx7zE+FzeXpvzYlluKMREMt5qLiRABE248YJgMAAA==
X-CMS-MailID: 20190605131812eucas1p1e6c2c4df2433c5c763e024f03d3a99fb
X-Msg-Generator: CA
X-RootMTR: 20190605125734epcas1p43b15cc8c556d917ca71b561791861cec
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190605125734epcas1p43b15cc8c556d917ca71b561791861cec
References: <20181201165348.24140-1-robdclark@gmail.com>
	<CAL_JsqJmPqis46Un91QyhXgdrVtfATMP_hTp6wSeSAfc8MLFfw@mail.gmail.com>
	<CAF6AEGs9Nsft8ofZkGz_yWBPBC+prh8dBSkJ4PJr8yk2c5FMdQ@mail.gmail.com>
	<CAF6AEGt-dhbQS5zZCNVTLT57OiUwO0RiP5bawTSu2RKZ-7W-aw@mail.gmail.com>
	<CAAFQd5BdrJFL5LKK8O5NPDKWfFgkTX_JU-jU3giEz33tj-jwCA@mail.gmail.com>
	<CAF6AEGtj+kyXqKeJK2-0e1jw_A4wz-yBEyv5zhf5Vfoi2_p2CA@mail.gmail.com>
	<CAAFQd5Dmr+xyd4dyc_44vJFpNpwK6+MgG+ensoey59HgbxXV6g@mail.gmail.com>
	<CGME20190605125734epcas1p43b15cc8c556d917ca71b561791861cec@epcas1p4.samsung.com>
	<CAF6AEGuj=QmEWZVzHMtoDgO0M0t-W9+tay5F4AKYThZqy=nkdA@mail.gmail.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: freedreno <freedreno@lists.freedesktop.org>, devicetree@vger.kernel.org,
	David Airlie <airlied@linux.ie>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Will Deacon <will.deacon@arm.com>, Doug Anderson <dianders@chromium.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>, Sean Paul <seanpaul@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Frank Rowand <frowand.list@gmail.com>,
	Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Rob,

On 2019-06-05 14:57, Rob Clark wrote:
> On Tue, Jun 4, 2019 at 11:58 PM Tomasz Figa <tfiga@chromium.org> wrote:
>> But first of all, I remember Marek already submitted some patches long
>> ago that extended struct driver with some flag that means that the
>> driver doesn't want the IOMMU to be attached before probe. Why
>> wouldn't that work? Sounds like a perfect opt-out solution.
> Actually, yeah.. we should do that.  That is the simplest solution.

Tomasz has very good memory. It took me a while to find that old patches:

https://patchwork.kernel.org/patch/4677251/
https://patchwork.kernel.org/patch/4677941/
https://patchwork.kernel.org/patch/4677401/

It looks that my idea was a bit ahead of its time ;)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
