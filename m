Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B27A21B804
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 16:13:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A1A889753;
	Fri, 10 Jul 2020 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8N5+XWrtCCBK; Fri, 10 Jul 2020 14:13:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 65A468974E;
	Fri, 10 Jul 2020 14:13:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A16CC016F;
	Fri, 10 Jul 2020 14:13:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2A20EC016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 14:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 25CF789CA1
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 14:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dZmotnkeYPGy for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 14:13:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5EE9C89CA4
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 14:13:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E00A920C; Fri, 10 Jul 2020 16:13:50 +0200 (CEST)
Date: Fri, 10 Jul 2020 16:13:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Chao Hao <chao.hao@mediatek.com>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
Message-ID: <20200710141349.GJ27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, TH Yang <th.yang@mediatek.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
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

On Fri, Jul 03, 2020 at 12:41:17PM +0800, Chao Hao wrote:
> Chao Hao (10):
>   dt-bindings: mediatek: Add bindings for MT6779
>   iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to MISC_CTRL
>   iommu/mediatek: Use a u32 flags to describe different HW features
>   iommu/mediatek: Setting MISC_CTRL register
>   iommu/mediatek: Move inv_sel_reg into the plat_data
>   iommu/mediatek: Add sub_comm id in translation fault
>   iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register definition
>   iommu/mediatek: Extend protect pa alignment value
>   iommu/mediatek: Modify MMU_CTRL register setting
>   iommu/mediatek: Add mt6779 basic support

Applied, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
