Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49632B888
	for <lists.iommu@lfdr.de>; Wed,  3 Mar 2021 15:17:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8AE4839C0;
	Wed,  3 Mar 2021 14:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ex3e5DInCHI; Wed,  3 Mar 2021 14:17:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA68883842;
	Wed,  3 Mar 2021 14:17:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C652C0001;
	Wed,  3 Mar 2021 14:17:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ADB3EC0001
 for <iommu@lists.linux-foundation.org>; Wed,  3 Mar 2021 14:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE7183842
 for <iommu@lists.linux-foundation.org>; Wed,  3 Mar 2021 14:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APp-2Gqick_M for <iommu@lists.linux-foundation.org>;
 Wed,  3 Mar 2021 14:17:05 +0000 (UTC)
X-Greylist: delayed 00:05:57 by SQLgrey-1.8.0
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2CE3183827
 for <iommu@lists.linux-foundation.org>; Wed,  3 Mar 2021 14:17:05 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 7FB73407626E;
 Wed,  3 Mar 2021 14:10:56 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:10:56 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] Revert "iommu/amd: Fix performance counter initialization"
In-Reply-To: <a803de32-eec8-a0b1-69e6-43259ba5c656@amd.com>
Message-ID: <alpine.LNX.2.20.13.2103031648190.15170@monopod.intra.ispras.ru>
References: <20210303121156.76621-1-pmenzel@molgen.mpg.de>
 <a803de32-eec8-a0b1-69e6-43259ba5c656@amd.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, David Coe <david.coe@live.co.uk>,
 iommu@lists.linux-foundation.org, Shuah Khan <skhan@linuxfoundation.org>,
 Tj <ml.linux@elloe.vision>
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

On Wed, 3 Mar 2021, Suravee Suthikulpanit wrote:

> > Additionally, alternative proposed solutions [1] were not considered or
> > discussed.
> > 
> > [1]:https://lore.kernel.org/linux-iommu/alpine.LNX.2.20.13.2006030935570.3181@monopod.intra.ispras.ru/
> 
> This check has been introduced early on to detect a HW issue for
> certain platforms in the past, where the performance counters are not
> accessible and would result in silent failure when try to use the
> counters. This is considered legacy code, and can be removed if we
> decide to no longer provide sanity check for such case.

Which platforms? There is no such information in the code or the commit
messages that introduced this.

According to AMD's documentation, presence of performance counters is
indicated by "PCSup" bit in the "EFR" register. I don't think the driver
should second-guess that. If there were platforms where the CPU or the
firmware lied to the OS (EFR[PCSup] was 1, but counters were not present),
I think that should have been handled in a more explicit manner, e.g.
via matching broken CPUs by cpuid.

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
