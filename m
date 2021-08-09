Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7753E4233
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 11:11:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD05C40358;
	Mon,  9 Aug 2021 09:11:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zopJ3oYik0Ny; Mon,  9 Aug 2021 09:11:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 689F2402DF;
	Mon,  9 Aug 2021 09:11:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B1FFC000E;
	Mon,  9 Aug 2021 09:11:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50744C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CA2140179
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJOBKSxEGy1c for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 09:11:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0ACE400F5
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:11:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F0AE01F1; Mon,  9 Aug 2021 11:11:46 +0200 (CEST)
Date: Mon, 9 Aug 2021 11:11:42 +0200
From: "joro@8bytes.org" <joro@8bytes.org>
To: Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>
Subject: Re: [PATCH v7 00/12] Clean up "mediatek,larb"
Message-ID: <YRDxTmvA9PcSRQUe@8bytes.org>
References: <20210730025238.22456-1-yong.wu@mediatek.com>
 <YQfALZNWyw8VKODp@8bytes.org>
 <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed099698f63bec6771561bcad7022dbff184ce7f.camel@mediatek.com>
Cc: Xia Jiang =?utf-8?B?KOaxn+mcnik=?= <Xia.Jiang@mediatek.com>,
 "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "will.deacon@arm.com" <will.deacon@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Huang =?utf-8?B?KOm7g+W7uuWYiSk=?= <Anthony.Huang@mediatek.com>,
 Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
 "drinkcat@chromium.org" <drinkcat@chromium.org>,
 "krzysztof.kozlowski@canonical.com" <krzysztof.kozlowski@canonical.com>,
 "evgreen@chromium.org" <evgreen@chromium.org>,
 "eizan@chromium.org" <eizan@chromium.org>,
 "mka@chromium.org" <mka@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 Yi Kuo =?utf-8?B?KOmDreaHvyk=?= <Yi.Kuo@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Ming-Fan Chen =?utf-8?B?KOmZs+aYjuaxjik=?= <Ming-Fan.Chen@mediatek.com>,
 Tiffany Lin =?utf-8?B?KOael+aFp+ePiik=?= <tiffany.lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Anan Sun =?utf-8?B?KOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
 "acourbot@chromium.org" <acourbot@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

T24gTW9uLCBBdWcgMDksIDIwMjEgYXQgMDg6MzA6MDNBTSArMDAwMCwgWW9uZyBXdSAo5ZC05YuH
KSB3cm90ZToKPiBUaGFua3MgdmVyeSBtdWNoIGZvciB5b3VyIGNvbmZpcm0uIEkgd2lsbCB5b3Vy
IEFjayBmb3IgaW9tbXUgcGFydCBpbgo+IHRoZSBuZXh0IHZlcnNpb24uCgpOb3RlIHRoYXQgbXkg
YWNrIGlzIGNvbmRpdGlvbmFsIG9uIHRoZSBwcmVtaXNlIHRoYXQgTWF0dGhpYXMgaGFzCnJldmll
d2VkIHRoZSBJT01NVSBwYXJ0cy4KClRoYW5rcywKCglKb2VyZwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppb21tdSBtYWlsaW5nIGxpc3QKaW9tbXVAbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3Jn
L21haWxtYW4vbGlzdGluZm8vaW9tbXU=
