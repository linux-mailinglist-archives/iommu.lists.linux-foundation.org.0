Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFA510E95
	for <lists.iommu@lfdr.de>; Wed, 27 Apr 2022 04:13:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8ED3960F05;
	Wed, 27 Apr 2022 02:13:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5WTRIzaiGGw; Wed, 27 Apr 2022 02:13:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E7CFD60F4A;
	Wed, 27 Apr 2022 02:13:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B29E4C002D;
	Wed, 27 Apr 2022 02:13:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D1E82C002D
 for <iommu@lists.linux-foundation.org>; Wed, 27 Apr 2022 02:13:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFF8881B01
 for <iommu@lists.linux-foundation.org>; Wed, 27 Apr 2022 02:13:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dNn7fTqwVfdm for <iommu@lists.linux-foundation.org>;
 Wed, 27 Apr 2022 02:13:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 74E1B81A6A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Apr 2022 02:13:16 +0000 (UTC)
X-UUID: 4d52bf4950e9408cb2f74b0ba4b4e415-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:cbcf598e-b9c4-4d07-b602-6eb723e8c0d7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:22,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:22
X-CID-INFO: VERSION:1.1.4, REQID:cbcf598e-b9c4-4d07-b602-6eb723e8c0d7, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:22,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:22
X-CID-META: VersionHash:faefae9, CLOUDID:ed2999c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:28|100|17|19|48|101,TC:nil,Content:0,EDM:-3,File:
 nil,QS:0,BEC:nil
X-UUID: 4d52bf4950e9408cb2f74b0ba4b4e415-20220427
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 642688658; Wed, 27 Apr 2022 10:13:09 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 10:13:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 10:13:07 +0800
To: <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/mediatek: fix NULL pointer dereference when
 printing dev_name
Date: Wed, 27 Apr 2022 10:13:08 +0800
Message-ID: <20220427021308.22855-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <9debe3ab-603d-0d30-a6aa-8963b48e83d4@arm.com>
References: <9debe3ab-603d-0d30-a6aa-8963b48e83d4@arm.com>
MIME-Version: 1.0
X-MTK: N
Cc: miles.chen@mediatek.com, jroedel@suse.de, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
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
From: Miles Chen via iommu <iommu@lists.linux-foundation.org>
Reply-To: Miles Chen <miles.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

hi Robin,

>> -	link = device_link_add(dev, larbdev,
>> -			       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
>> -	if (!link)
>> -		dev_err(dev, "Unable to link %s\n", dev_name(larbdev));
>> +	if (larbdev) {
>
>Until the MT8195 infra MMU support lands, is there ever a case where 
>it's actually valid for larbdev to be NULL? If not, I think it would be 
>a lot clearer to explicitly fail the probe here, rather than silently 
>continue and risk fatal errors, hangs, or other weird behaviour if 
>there's no guarantee that the correct LARB is powered up (plus then the 
>release callbacks wouldn't need to worry about it either).

Thanks, I will do probe fail in patch v3 and remove the release modification.

thanks,
Miles

>
>Robin.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
