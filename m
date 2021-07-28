Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 936973D8C11
	for <lists.iommu@lfdr.de>; Wed, 28 Jul 2021 12:40:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04111400E1;
	Wed, 28 Jul 2021 10:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eLi2dSMmMHdi; Wed, 28 Jul 2021 10:40:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D660B40207;
	Wed, 28 Jul 2021 10:40:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85025C0022;
	Wed, 28 Jul 2021 10:40:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58E8EC000E
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 10:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4772B606D3
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 10:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=mailerdienst.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyLQVZOXBKgo for <iommu@lists.linux-foundation.org>;
 Wed, 28 Jul 2021 10:40:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mxwww.masterlogin.de (mxwww.masterlogin.de
 [IPv6:2a03:2900:1:1::a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0447605CB
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 10:40:34 +0000 (UTC)
Received: from mxout1.routing.net (unknown [192.168.10.81])
 by backup.mxwww.masterlogin.de (Postfix) with ESMTPS id 08C6D2C5C4
 for <iommu@lists.linux-foundation.org>; Wed, 28 Jul 2021 10:35:19 +0000 (UTC)
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
 by mxout1.routing.net (Postfix) with ESMTP id 506D13FC25;
 Wed, 28 Jul 2021 10:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627468513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NxU06HLhrl9+rLyaZWdBMl0a7U1akRA+tjgjOr6pMYU=;
 b=LIT9It63QvpF3ZFNFDrvNEFGugyOiUgFtR6AvRUGkvR3zsWvUmhuvWsn0kr6EaaKe5iD8m
 zRmGZD17fkL/vKmYQKW+5LPpi5yY4bc0ni3NuK0HPfYULxPZlVzmvwOmG44gwyBhFswbW9
 n5FKE5/VryVSVQSKxjhUpFhfk5T7Eu8=
Received: from frank-s9 (fttx-pool-217.61.145.245.bambit.de [217.61.145.245])
 by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 98E7C1007DD;
 Wed, 28 Jul 2021 10:35:12 +0000 (UTC)
Date: Wed, 28 Jul 2021 12:35:07 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <YO/hpPpu6Z526+Ia@8bytes.org>
References: <20210715071150.82157-1-linux@fw-web.de>
 <YO/hpPpu6Z526+Ia@8bytes.org>
MIME-Version: 1.0
Subject: Re: [PATCH] iommu: check if group is NULL before remove device
To: Joerg Roedel <joro@8bytes.org>
From: Frank Wunderlich <linux@fw-web.de>
Message-ID: <F2ABC95E-D39F-4713-8959-91366DE4ECB8@fw-web.de>
X-Mail-ID: c5da2f25-14af-4163-bd01-1aee1eb1c340
Cc: iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Joerg,

Sorry for late reply, somehow i marked message as read without answering it.

Am 15. Juli 2021 09:20:04 MESZ schrieb Joerg Roedel <joro@8bytes.org>:
>On Thu, Jul 15, 2021 at 09:11:50AM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files.de>
>> 
>> if probe is failing, iommu_group may be not initialized,
>
>Sentences start with capital letters.
>
>IOMMU patch subjects too, after the 'iommu:' prefix.

Will fix these in v2

>> so freeing it will result in NULL pointer access
>
>Please describe in more detail how this NULL-ptr dereference is
>triggered.

I had this by testing this series: 
https://patchwork.kernel.org/project/linux-mediatek/list/?series=515129

Initialization in mtk driver was failed (i guess the iommu group was not yet created), cleanup was started and so this function is called with a NULL group pointer. I can try to find my debug-trace if you need a kind of backtrace.

regards Frank
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
