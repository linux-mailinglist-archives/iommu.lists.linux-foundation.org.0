Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7773C990C
	for <lists.iommu@lfdr.de>; Thu, 15 Jul 2021 08:52:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6F59405F9;
	Thu, 15 Jul 2021 06:52:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HKLQoOf9OoTm; Thu, 15 Jul 2021 06:52:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id E900440524;
	Thu, 15 Jul 2021 06:52:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBFC7C0022;
	Thu, 15 Jul 2021 06:52:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9889EC000E
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 06:52:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F12660BBA
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 06:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gft5AE0PCKQU for <iommu@lists.linux-foundation.org>;
 Thu, 15 Jul 2021 06:52:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C680E60BA8
 for <iommu@lists.linux-foundation.org>; Thu, 15 Jul 2021 06:52:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 0D83D352; Thu, 15 Jul 2021 08:52:40 +0200 (CEST)
Date: Thu, 15 Jul 2021 08:52:33 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v4 0/3] Apple M1 DART IOMMU driver
Message-ID: <YO/bMUAOLRgOJOvl@8bytes.org>
References: <20210627143405.77298-1-sven@svenpeter.dev>
 <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
 <CAK8P3a18XK2mfMGbZ+M32Mbabhbkd+=DNrnzampOah_j=rWozw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a18XK2mfMGbZ+M32Mbabhbkd+=DNrnzampOah_j=rWozw@mail.gmail.com>
Cc: DTML <devicetree@vger.kernel.org>,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Robin Murphy <robin.murphy@arm.com>, Hector Martin <marcan@marcan.st>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Alexander Graf <graf@amazon.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Stan Skowronek <stan@corellium.com>
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

On Wed, Jul 14, 2021 at 10:51:34PM +0200, Arnd Bergmann wrote:
> The question is how we can best allow one but not the other.

By only allowing to allocate domains of type IDENTITY and DMA, but fail
to allocate UNMANAGED domains.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
