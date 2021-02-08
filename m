Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFE2312AC4
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 07:35:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA901867EB;
	Mon,  8 Feb 2021 06:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZICW3vKqjkjN; Mon,  8 Feb 2021 06:35:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BC8CA867F3;
	Mon,  8 Feb 2021 06:35:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BF78C1DA9;
	Mon,  8 Feb 2021 06:35:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5C80C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 06:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA5D286FFB
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 06:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wT-y94296ps8 for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 06:35:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by hemlock.osuosl.org (Postfix) with ESMTP id D1DD786FF1
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 06:35:38 +0000 (UTC)
X-UUID: 9b9ccf36a8f8412a87f8fd34127b7a8d-20210208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3N9rRASFzxmeOt/wKztN0VIoYEGnGsamx+GlAqJh9+4=; 
 b=GUGSnm/9H8jEaAidO3sdb9qdvwlFwyjmwO+0edSlA1nQh7eH+Q/ntAg0t/zf675jEsMG42KldyEJaThQlZIz5IyMSzvLFTgRXQFlpx+4PZcq+a/SUl69oQoDMoMDaI8mCnVoh6sFLgSXwJVnLQZE00sCDge0I/X72nCWe0EWSgo=;
X-UUID: 9b9ccf36a8f8412a87f8fd34127b7a8d-20210208
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 452771816; Mon, 08 Feb 2021 14:35:27 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 8 Feb 2021 14:35:25 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 8 Feb 2021 14:35:24 +0800
Message-ID: <1612766125.19482.3.camel@mhfsdcap03>
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
From: Yong Wu <yong.wu@mediatek.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Joerg Roedel <joro@8bytes.org>
Date: Mon, 8 Feb 2021 14:35:25 +0800
In-Reply-To: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A293A2F4DB79585306E07C30A2048CADF97377D97F56478078E0BA17EB9CA5692000:8
X-MTK: N
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Joe Perches <joe@perches.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
 Will Deacon <will@kernel.org>
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

On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> with an underscore, not with a hyphen.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> 
> Repair this minor typo in the file pattern.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20210205
> 
> Yong, please ack.

+Joerg.

sorry for the typo.

Acked-by: Yong Wu <yong.wu@mediatek.com>

> Will, please pick this minor fixup for your iommu-next tree.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 674f42375acf..6b507e8d7828 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11200,7 +11200,7 @@ L:	iommu@lists.linux-foundation.org
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Supported
>  F:	Documentation/devicetree/bindings/iommu/mediatek*
> -F:	drivers/iommu/mtk-iommu*
> +F:	drivers/iommu/mtk_iommu*
>  F:	include/dt-bindings/memory/mt*-port.h
>  
>  MEDIATEK JPEG DRIVER

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
