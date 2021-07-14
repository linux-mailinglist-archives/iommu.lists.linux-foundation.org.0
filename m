Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D13C82AD
	for <lists.iommu@lfdr.de>; Wed, 14 Jul 2021 12:25:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D21B40695;
	Wed, 14 Jul 2021 10:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MaSENI3fTg6P; Wed, 14 Jul 2021 10:25:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 58C87414B8;
	Wed, 14 Jul 2021 10:25:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 133BAC001F;
	Wed, 14 Jul 2021 10:25:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C15B7C000E
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFDB260A72
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYIZVzilMvPn for <iommu@lists.linux-foundation.org>;
 Wed, 14 Jul 2021 10:25:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16904606CA
 for <iommu@lists.linux-foundation.org>; Wed, 14 Jul 2021 10:25:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7006E3D0; Wed, 14 Jul 2021 12:25:47 +0200 (CEST)
Date: Wed, 14 Jul 2021 12:25:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Konrad Rzeszutek Wilk <konrad@darnok.org>
Subject: Re: [PATCH] iommu/amd: Enable swiotlb if any device supports iommu
 v2 and uses identity mapping
Message-ID: <YO67m/jaBvco+I36@8bytes.org>
References: <20210708074232.924844-1-kai.heng.feng@canonical.com>
 <YObFJREB9/JlcNZP@8bytes.org>
 <fde11cec-d1bd-49be-f129-c69a973d1b3b@arm.com>
 <CAAd53p40RcG0oeYr9QAKMjYRtyq7he=d_b_a39n4Rt5JSVScRQ@mail.gmail.com>
 <f3bdedcb-5602-cbca-7df1-019e8b8c4217@arm.com>
 <YO4odF0EwqxfNLFq@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YO4odF0EwqxfNLFq@fedora>
Cc: will@kernel.org,
 "open list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Robin Murphy <robin.murphy@arm.com>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Jul 13, 2021 at 07:57:40PM -0400, Konrad Rzeszutek Wilk wrote:
> The SWIOTLB does have support to do late initialization (xen-pcifront
> does that for example - so if you add devices that can't do 64-bit it
> will allocate something like 4MB).

That sounds like a way to evaluate. I suggest to allocate the SWIOTLB
memory at boot and when the IOMMUs are initialized we re-evaluate what
we ended up with and free the SWIOTLB memory if its not needed.

If that turns out to be wrong during runtime (e.g. because a device is
switched to a passthrough default domain at runtime), we allocate a
small aperture for this device like the above mentioned 4MB.

(A boot option to always keep the aperture around might also be helpful
 for some setups)

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
