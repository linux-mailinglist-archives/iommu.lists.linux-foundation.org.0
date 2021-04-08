Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7AF357D25
	for <lists.iommu@lfdr.de>; Thu,  8 Apr 2021 09:18:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEE4C84D4D;
	Thu,  8 Apr 2021 07:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GnzInDJ6g4C8; Thu,  8 Apr 2021 07:18:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF11584D43;
	Thu,  8 Apr 2021 07:18:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9109C000A;
	Thu,  8 Apr 2021 07:18:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59506C000A
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 07:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48795400DB
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 07:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wBqoEyeVW1yx for <iommu@lists.linux-foundation.org>;
 Thu,  8 Apr 2021 07:18:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E781400D7
 for <iommu@lists.linux-foundation.org>; Thu,  8 Apr 2021 07:18:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EA26C426; Thu,  8 Apr 2021 09:18:49 +0200 (CEST)
Date: Thu, 8 Apr 2021 09:18:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Nadav Amit <namit@vmware.com>
Subject: Re: [PATCH] iommu/amd: page-specific invalidations for more than one
 page
Message-ID: <YG6uWFAS6GCWJPGO@8bytes.org>
References: <20210323210619.513069-1-namit@vmware.com>
 <YG2C42UdIEsWex2L@8bytes.org>
 <71C74038-943D-4041-B6FF-09A8C40CA204@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71C74038-943D-4041-B6FF-09A8C40CA204@vmware.com>
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Will Deacon <will@kernel.org>, Jiajun Cao <caojiajun@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Nadav,

On Wed, Apr 07, 2021 at 05:57:31PM +0000, Nadav Amit wrote:
> I tested it on real bare-metal hardware. I ran some basic I/O workloads
> with the IOMMU enabled, checkers enabled/disabled, and so on.
> 
> However, I only tested the IOMMU-flushes and I did not test that the
> device-IOTLB flush work, since I did not have the hardware for that.
> 
> If you can refer me to the old patches, I will have a look and see
> whether I can see a difference in the logic or test them. If you want
> me to run different tests - let me know. If you want me to remove
> the device-IOTLB invalidations logic - that is also fine with me.

Here is the patch-set, it is from 2010 and against a very old version of
the AMD IOMMU driver:

	https://lore.kernel.org/lkml/1265898797-32183-1-git-send-email-joerg.roedel@amd.com/

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
