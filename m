Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F1818B927
	for <lists.iommu@lfdr.de>; Thu, 19 Mar 2020 15:16:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 194A3883FA;
	Thu, 19 Mar 2020 14:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wosTgQKWcTKZ; Thu, 19 Mar 2020 14:16:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5419088363;
	Thu, 19 Mar 2020 14:16:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46892C07FF;
	Thu, 19 Mar 2020 14:16:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4943AC07FF
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2E09287EAC
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d4hXjxAZW3-R for <iommu@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 14:16:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6994E87E9B
 for <iommu@lists.linux-foundation.org>; Thu, 19 Mar 2020 14:16:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4919DAE6F;
 Thu, 19 Mar 2020 14:16:21 +0000 (UTC)
Date: Thu, 19 Mar 2020 15:16:19 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/vt-d: silence a RCU-list debugging warning
Message-ID: <20200319141619.GC611@suse.de>
References: <20200317150326.1659-1-cai@lca.pw>
 <36b9e69b-ee3f-c17d-1788-64448ce8bc14@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <36b9e69b-ee3f-c17d-1788-64448ce8bc14@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, Mar 18, 2020 at 01:27:53PM +0800, Lu Baolu wrote:
> On 2020/3/17 23:03, Qian Cai wrote:
> > dmar_find_atsr() calls list_for_each_entry_rcu() outside of an RCU read
> > side critical section but with dmar_global_lock held. Silence this
> > false positive.
> > 
> >   drivers/iommu/intel-iommu.c:4504 RCU-list traversed in non-reader section!!
> >   1 lock held by swapper/0/1:
> >   #0: ffffffff9755bee8 (dmar_global_lock){+.+.}, at: intel_iommu_init+0x1a6/0xe19
> > 
> >   Call Trace:
> >    dump_stack+0xa4/0xfe
> >    lockdep_rcu_suspicious+0xeb/0xf5
> >    dmar_find_atsr+0x1ab/0x1c0
> >    dmar_parse_one_atsr+0x64/0x220
> >    dmar_walk_remapping_entries+0x130/0x380
> >    dmar_table_init+0x166/0x243
> >    intel_iommu_init+0x1ab/0xe19
> >    pci_iommu_init+0x1a/0x44
> >    do_one_initcall+0xae/0x4d0
> >    kernel_init_freeable+0x412/0x4c5
> >    kernel_init+0x19/0x193
> > 
> > Signed-off-by: Qian Cai <cai@lca.pw>
> 
> How about changing the commit subject to
> "iommu/vt-d: Silence RCU-list debugging warning in dmar_find_atsr()"?
> 
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Fixed up the subject and applied it, thanks.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
