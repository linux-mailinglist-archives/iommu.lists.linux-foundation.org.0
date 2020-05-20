Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B161DAB35
	for <lists.iommu@lfdr.de>; Wed, 20 May 2020 09:00:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B66D87668;
	Wed, 20 May 2020 07:00:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5zC2+4DwwIX; Wed, 20 May 2020 07:00:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7CCC387662;
	Wed, 20 May 2020 07:00:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 64CF4C0176;
	Wed, 20 May 2020 07:00:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1205AC0176
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 07:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7FE987662
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 07:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xNKpN0iBY6s for <iommu@lists.linux-foundation.org>;
 Wed, 20 May 2020 07:00:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by whitealder.osuosl.org (Postfix) with ESMTP id C99358569B
 for <iommu@lists.linux-foundation.org>; Wed, 20 May 2020 07:00:15 +0000 (UTC)
X-UUID: e6a65228779542d19db0772b649840c4-20200520
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=5Lcz411vQymr8LOv9ZOMpOR7TAY9qOG8MgWx5t4pG8Q=; 
 b=T2OkHGAlv6ueJo8PsNx2m2Vp9/AsNBJDkeqfsiVA4uXl0ez3QpMSJkvg/sVOjhfwLvK23KXAtAEDExQyW+I8g4matGeloAbQzhSDtgGRuf9pVtmPuNrn7hD6DyH+tIhqHnyipjxtKTg4DW0cm3smSvu0xxwyne01HOsw1U4BIpE=;
X-UUID: e6a65228779542d19db0772b649840c4-20200520
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 166912837; Wed, 20 May 2020 14:54:57 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 20 May 2020 14:54:53 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 20 May 2020 14:54:54 +0800
Message-ID: <1589957603.13912.2.camel@mhfsdcap03>
Subject: Re: [PATCH] iommu: Don't call .probe_finalize() under group->mutex
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Wed, 20 May 2020 14:53:23 +0800
In-Reply-To: <20200519132824.15163-1-joro@8bytes.org>
References: <20200519132824.15163-1-joro@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 255D14E269C30CBAC837F7C42790D730FB5613A0BD2417CC0B32DAEB4E59CBDF2000:8
X-MTK: N
Cc: Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, 2020-05-19 at 15:28 +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The .probe_finalize() call-back of some IOMMU drivers calls into
> arm_iommu_attach_device(). This function will call back into the
> IOMMU core code, where it tries to take group->mutex again, resulting
> in a deadlock.
> 
> As there is no reason why .probe_finalize() needs to be called under
> that mutex, move it after the lock has been released to fix the
> deadlock.
> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Reported-by: Yong Wu <yong.wu@mediatek.com>
> Fixes: deac0b3bed26 ("iommu: Split off default domain allocation from group assignment")
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Tested-by: Yong Wu <yong.wu@mediatek.com>

Tested on MediaTek-v1 mt2701 evb board.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
