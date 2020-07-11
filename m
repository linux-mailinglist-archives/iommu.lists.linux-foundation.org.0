Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9839B21C304
	for <lists.iommu@lfdr.de>; Sat, 11 Jul 2020 09:12:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3092D8997E;
	Sat, 11 Jul 2020 07:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tBa6YL9QIK1F; Sat, 11 Jul 2020 07:12:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9855589968;
	Sat, 11 Jul 2020 07:12:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C725C016F;
	Sat, 11 Jul 2020 07:12:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 75548C016F
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 07:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58956204AE
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 07:12:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iUjdU1VQ5xEY for <iommu@lists.linux-foundation.org>;
 Sat, 11 Jul 2020 07:12:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by silver.osuosl.org (Postfix) with ESMTP id 1C32F204A3
 for <iommu@lists.linux-foundation.org>; Sat, 11 Jul 2020 07:12:28 +0000 (UTC)
X-UUID: 6a255dd1d52a4162b9a29a9d328eb6a2-20200711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yilbJrHb4on0J7hThn4YoSbk9aK3TSJQjUpN3XgWrzE=; 
 b=nM2kFz5wU1FHh9xBxJ8fOzMTcgthThfLMN3XDWrbbKOjHaLejrwZVXH/HvXFKm0R9BzLVMK6QqaOPlxvlyCHUbXhwHlTsblRY3MKb20r4cS1G4ohhtVMZ38aC3jV9lZVUcCyjA83rcnWRJRA6hRIi0QLurpnbvyN69y4mfAj9w8=;
X-UUID: 6a255dd1d52a4162b9a29a9d328eb6a2-20200711
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLS)
 with ESMTP id 220947356; Sat, 11 Jul 2020 15:12:16 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 11 Jul 2020 15:12:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 15:12:14 +0800
Message-ID: <1594451493.16172.6.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>
Date: Sat, 11 Jul 2020 15:11:33 +0800
In-Reply-To: <20200710141349.GJ27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
 <20200710141349.GJ27672@8bytes.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 05BB3D50A356C307CD14C3C48E7C352C564F8EC9C54A287E85E8AED5818631902000:8
X-MTK: N
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 FY Yang <fy.yang@mediatek.com>, wsd_upstream@mediatek.com,
 TH Yang <th.yang@mediatek.com>, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 2020-07-10 at 16:13 +0200, Joerg Roedel wrote:
> On Fri, Jul 03, 2020 at 12:41:17PM +0800, Chao Hao wrote:
> > Chao Hao (10):
> >   dt-bindings: mediatek: Add bindings for MT6779
> >   iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to MISC_CTRL
> >   iommu/mediatek: Use a u32 flags to describe different HW features
> >   iommu/mediatek: Setting MISC_CTRL register
> >   iommu/mediatek: Move inv_sel_reg into the plat_data
> >   iommu/mediatek: Add sub_comm id in translation fault
> >   iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register definition
> >   iommu/mediatek: Extend protect pa alignment value
> >   iommu/mediatek: Modify MMU_CTRL register setting
> >   iommu/mediatek: Add mt6779 basic support
> 
> Applied, thanks.

Hi Joerg,

Thanks for the apply.

The SMI part always go with the IOMMU, Could you also help apply the
mt6779 SMI basical part [1][2]. Both has already got reviewed-by from
Rob and Matthias. and the [3] in that patchset is for performance
improvement, it's not so necessary, it can be send in another patchset.


[1] https://lore.kernel.org/patchwork/patch/1176833/
[2] https://lore.kernel.org/patchwork/patch/1176831/
[3] https://lore.kernel.org/patchwork/patch/1176832/
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
