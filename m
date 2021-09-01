Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id C24F23FCFCB
	for <lists.iommu@lfdr.de>; Wed,  1 Sep 2021 01:11:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4456240111;
	Tue, 31 Aug 2021 23:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id blcsuzgvJ_pQ; Tue, 31 Aug 2021 23:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3C17C404A9;
	Tue, 31 Aug 2021 23:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A6E9C000E;
	Tue, 31 Aug 2021 23:11:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0A6BC0010
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5A9B81A6A
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFvPsXjqFGVJ for <iommu@lists.linux-foundation.org>;
 Tue, 31 Aug 2021 23:10:57 +0000 (UTC)
X-Greylist: delayed 00:05:54 by SQLgrey-1.8.0
Received: from rosenzweig.io (rosenzweig.io [138.197.143.207])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 241EB81A65
 for <iommu@lists.linux-foundation.org>; Tue, 31 Aug 2021 23:10:57 +0000 (UTC)
Date: Tue, 31 Aug 2021 17:32:07 -0400
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v2 0/8] Support IOMMU page sizes larger than the CPU page
 size
Message-ID: <YS6f17iFVq9wYPFN@sunset>
References: <20210828153642.19396-1-sven@svenpeter.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210828153642.19396-1-sven@svenpeter.dev>
Cc: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>,
 Hector Martin <marcan@marcan.st>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Alexander Graf <graf@amazon.com>,
 Mohamed Mediouni <mohamed.mediouni@caramail.com>,
 Robin Murphy <robin.murphy@arm.com>
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

> Some background: On the Apple M1 the IOMMUs are hardwired to only support 16 KB pages.
> We'd still like to boot Linux with 4KB pages though because that's what most distros
> ship these days. This patch series adds support for that setup to the IOMMU DMA API.

This isn't just a distro issue -- efficient x86_64 emulation will rely
on 4KB as well (Rosetta, FEX, ...). Telling distros to use 16KB kernels
for Apple parts is just kicking the can down the road -- we want this
series even for kernels we build ourselves.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
