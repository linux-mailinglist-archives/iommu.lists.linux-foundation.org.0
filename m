Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AC43E429C
	for <lists.iommu@lfdr.de>; Mon,  9 Aug 2021 11:27:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5564027F;
	Mon,  9 Aug 2021 09:27:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g0nN6Wo1C_rv; Mon,  9 Aug 2021 09:27:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 4E90C4027A;
	Mon,  9 Aug 2021 09:27:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28465C001F;
	Mon,  9 Aug 2021 09:27:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77232C000E
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5FB5E6062F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RyrAUmW9dAog for <iommu@lists.linux-foundation.org>;
 Mon,  9 Aug 2021 09:27:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C62A560602
 for <iommu@lists.linux-foundation.org>; Mon,  9 Aug 2021 09:27:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3CAC31DCE; Mon,  9 Aug 2021 11:27:49 +0200 (CEST)
Date: Mon, 9 Aug 2021 11:27:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v5 0/3] Apple M1 DART IOMMU driver
Message-ID: <YRD0/qZek2iCwsJi@8bytes.org>
References: <20210803121651.61594-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803121651.61594-1-sven@svenpeter.dev>
Cc: devicetree@vger.kernel.org, r.czerwinski@pengutronix.de,
 Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Alexander Graf <graf@amazon.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org, Stan Skowronek <stan@corellium.com>
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

On Tue, Aug 03, 2021 at 02:16:48PM +0200, Sven Peter wrote:
> Sven Peter (3):
>   iommu/io-pgtable: Add DART pagetable format
>   dt-bindings: iommu: add DART iommu bindings
>   iommu/dart: Add DART iommu driver

Applied, thanks. This driver now lives in the apple/dart branch of the
IOMMU tree.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
