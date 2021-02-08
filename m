Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2D8312B7F
	for <lists.iommu@lfdr.de>; Mon,  8 Feb 2021 09:13:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7ACFF203E6;
	Mon,  8 Feb 2021 08:13:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0YSTGWUeNVbJ; Mon,  8 Feb 2021 08:13:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 829C3203EB;
	Mon,  8 Feb 2021 08:13:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0169BC013A;
	Mon,  8 Feb 2021 08:13:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CC476C013A
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B796686FFD
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLzZ73eTgb1P for <iommu@lists.linux-foundation.org>;
 Mon,  8 Feb 2021 08:13:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3712786ECC
 for <iommu@lists.linux-foundation.org>; Mon,  8 Feb 2021 08:13:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 596013A7; Mon,  8 Feb 2021 09:13:03 +0100 (CET)
Date: Mon, 8 Feb 2021 09:13:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: repair file pattern in MEDIATEK IOMMU DRIVER
Message-ID: <20210208081301.GB7302@8bytes.org>
References: <20210208061025.29198-1-lukas.bulwahn@gmail.com>
 <1612766125.19482.3.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1612766125.19482.3.camel@mhfsdcap03>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
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

On Mon, Feb 08, 2021 at 02:35:25PM +0800, Yong Wu wrote:
> On Mon, 2021-02-08 at 07:10 +0100, Lukas Bulwahn wrote:
> > Commit 6af4873852c4 ("MAINTAINERS: Add entry for MediaTek IOMMU") mentions
> > the pattern 'drivers/iommu/mtk-iommu*', but the files are actually named
> > with an underscore, not with a hyphen.
> > 
> > Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> > 
> >   warning: no file matches  F:    drivers/iommu/mtk-iommu*
> > 
> > Repair this minor typo in the file pattern.
> > 
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210205
> > 
> > Yong, please ack.
> 
> +Joerg.
> 
> sorry for the typo.
> 
> Acked-by: Yong Wu <yong.wu@mediatek.com>

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
