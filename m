Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B5746977B
	for <lists.iommu@lfdr.de>; Mon,  6 Dec 2021 14:49:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABD3C606F6;
	Mon,  6 Dec 2021 13:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GqQ1URaMJURa; Mon,  6 Dec 2021 13:48:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 527E16090B;
	Mon,  6 Dec 2021 13:48:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC344C0071;
	Mon,  6 Dec 2021 13:48:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 100D5C0012
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 13:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EADCC40911
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 13:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5571VFcNaxhh for <iommu@lists.linux-foundation.org>;
 Mon,  6 Dec 2021 13:48:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5973B40907
 for <iommu@lists.linux-foundation.org>; Mon,  6 Dec 2021 13:48:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id ED55F396; Mon,  6 Dec 2021 14:48:50 +0100 (CET)
Date: Mon, 6 Dec 2021 14:48:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v9 00/15] Clean up "mediatek,larb"
Message-ID: <Ya4UwQ6QhjLA+OiS@8bytes.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <Ya35hNY0iAR/JPmI@8bytes.org>
 <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <657ad1fc-0a90-bfc5-d4f1-9ff007f9f672@xs4all.nl>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 yf.wang@mediatek.com, anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Evan Green <evgreen@chromium.org>, Eizan Miyamoto <eizan@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Daniel Vetter <daniel@ffwll.ch>, Robin Murphy <robin.murphy@arm.com>
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

On Mon, Dec 06, 2021 at 01:33:36PM +0100, Hans Verkuil wrote:
> I think it might be easiest if it is all going through the media subsystem
> (except for the dts patches, we don't handle those unless specifically
> requested to do so). I need a resend for jpeg bindings txt to yaml
> conversion series first, though. This time with the linux-media mailinglist
> included :-)
> 
> I would need your Ack for the iommu patches as well, of course.

Okay, makes sense. IOMMU parts are 

Acked-by: Joerg Roedel <jroedel@suse.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
