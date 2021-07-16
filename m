Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EA43CB9E4
	for <lists.iommu@lfdr.de>; Fri, 16 Jul 2021 17:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A880A60699;
	Fri, 16 Jul 2021 15:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G0ZcLRcuCH2v; Fri, 16 Jul 2021 15:33:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 90A7B6FCF0;
	Fri, 16 Jul 2021 15:33:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15188C000E;
	Fri, 16 Jul 2021 15:33:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 872D3C000E
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 15:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 669E58447D
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 15:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aoD4F_pxGHB1 for <iommu@lists.linux-foundation.org>;
 Fri, 16 Jul 2021 15:33:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 653708447C
 for <iommu@lists.linux-foundation.org>; Fri, 16 Jul 2021 15:33:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 74B81D6E;
 Fri, 16 Jul 2021 08:32:59 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A607E3F774;
 Fri, 16 Jul 2021 08:32:56 -0700 (PDT)
Subject: Re: [PATCH v4 0/3] Apple M1 DART IOMMU driver
To: Christoph Hellwig <hch@infradead.org>
References: <20210627143405.77298-1-sven@svenpeter.dev>
 <7261df01-34a9-4e53-37cd-ae1aa15b1fb4@arm.com>
 <YPEmA0rdXHiGtHSx@infradead.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <0d20bd6b-d0a1-019c-6398-b12f83f4fdf7@arm.com>
Date: Fri, 16 Jul 2021 16:32:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YPEmA0rdXHiGtHSx@infradead.org>
Content-Language: en-GB
Cc: Arnd Bergmann <arnd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 r.czerwinski@pengutronix.de, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Alexander Graf <graf@amazon.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Mark Kettenis <mark.kettenis@xs4all.nl>, Will Deacon <will@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021-07-16 07:24, Christoph Hellwig wrote:
> On Wed, Jul 14, 2021 at 07:19:50PM +0100, Robin Murphy wrote:
>> Even at the DMA API level you could hide *some* of it (at the cost of
>> effectively only having 1/4 of the usable address space), but there are
>> still cases like where v4l2 has a hard requirement that a page-aligned
>> scatterlist can be mapped into a contiguous region of DMA addresses.
> 
> Where does v4l2 make that broken assumption?  Plenty of dma mapping
> implementations including dma-direct do not support that.

See vb2_dc_get_contiguous_size() and its callers. I still remember 
spending an entire work day on writing one email at the culmination of 
this discussion:

https://lore.kernel.org/linux-iommu/56409B6D.5090903@arm.com/

809eac54cdd6 was framed as an efficiency improvement because it 
technically was one (and something I had wanted to implement anyway), 
but it was also very much to save myself from any further email debates 
or customer calls about "regressing" code ported from 32-bit platforms...

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
