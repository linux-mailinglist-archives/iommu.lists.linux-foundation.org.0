Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A8F1EC9C7
	for <lists.iommu@lfdr.de>; Wed,  3 Jun 2020 08:54:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E796086987;
	Wed,  3 Jun 2020 06:54:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFb7DPS2bSwv; Wed,  3 Jun 2020 06:54:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1CEC86975;
	Wed,  3 Jun 2020 06:54:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B76C8C0895;
	Wed,  3 Jun 2020 06:54:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E630C016E
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 06:54:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F133E87746
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 06:54:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jxdc9KMrIA7C for <iommu@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 06:54:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5AB37875D9
 for <iommu@lists.linux-foundation.org>; Wed,  3 Jun 2020 06:54:47 +0000 (UTC)
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
 by smtp.ispras.ru (Postfix) with ESMTP id 2F94B203BF;
 Wed,  3 Jun 2020 09:54:42 +0300 (MSK)
Date: Wed, 3 Jun 2020 09:54:42 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
In-Reply-To: <c0f9f676-eff8-572d-9174-4c22c6095a3d@linuxfoundation.org>
Message-ID: <alpine.LNX.2.20.13.2006030935570.3181@monopod.intra.ispras.ru>
References: <20200529200738.1923-1-amonakov@ispras.ru>
 <alpine.LNX.2.20.13.2005311014450.16067@monopod.intra.ispras.ru>
 <c0f9f676-eff8-572d-9174-4c22c6095a3d@linuxfoundation.org>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Tue, 2 Jun 2020, Shuah Khan wrote:

> I changed the logic to read config to get max banks and counters
> before checking if counters are writable and tried writing to all.
> The result is the same and all of them aren't writable. However,
> when disable the writable check and assume they are, I can run
[snip]

This is similar to what I did. I also noticed that counters can
be successfully used with perf if the initial check is ignored.
I was considering sending a patch to remove the check and adjust
the event counting logic to use counters as read-only, but after
a bit more investigation I've noticed how late pci_enable_device
is done, and came up with this patch. It's a path of less resistance:
I'd expect maintainers to be more averse to removing the check
rather than fixing it so it works as intended (even though I think
the check should not be there in the first place).

However:

The ability to modify the counters is needed only for sampling the
events (getting an interrupt when a counter overflows). There's no
code to do that for these AMD IOMMU counters. A solution I would
prefer is to not write to those counters at all. It would simplify or
even remove a bunch of code. I can submit a corresponding patch if
there's general agreement this path is ok.

What do you think?

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
