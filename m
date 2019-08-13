Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BC13C8ACCC
	for <lists.iommu@lfdr.de>; Tue, 13 Aug 2019 04:43:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AAEA2DA3;
	Tue, 13 Aug 2019 02:43:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 85FF2D9C
	for <iommu@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:43:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 10F4587B
	for <iommu@lists.linux-foundation.org>;
	Tue, 13 Aug 2019 02:43:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD8793A17F;
	Tue, 13 Aug 2019 02:43:25 +0000 (UTC)
Received: from dhcp-128-65.nay.redhat.com (ovpn-12-72.pek2.redhat.com
	[10.72.12.72])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F5D55B681;
	Tue, 13 Aug 2019 02:43:20 +0000 (UTC)
Date: Tue, 13 Aug 2019 10:43:17 +0800
From: Dave Young <dyoung@redhat.com>
To: Michal Hocko <mhocko@kernel.org>
Subject: Re: Crash kernel with 256 MB reserved memory runs into OOM condition
Message-ID: <20190813024317.GA2862@dhcp-128-65.nay.redhat.com>
References: <d65e4a42-1962-78c6-1b5a-65cb70529d62@molgen.mpg.de>
	<20190812095029.GE5117@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812095029.GE5117@dhcp22.suse.cz>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 13 Aug 2019 02:43:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, kasong@redhat.com,
	linux-pci@vger.kernel.org, "x86@kernel.org" <x86@kernel.org>,
	kexec@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org,
	Donald Buczek <buczek@molgen.mpg.de>, lijiang@redhat.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi,

On 08/12/19 at 11:50am, Michal Hocko wrote:
> On Mon 12-08-19 11:42:33, Paul Menzel wrote:
> > Dear Linux folks,
> > 
> > 
> > On a Dell PowerEdge R7425 with two AMD EPYC 7601 (total 128 threads) and
> > 1 TB RAM, the crash kernel with 256 MB of space reserved crashes.
> > 
> > Please find the messages of the normal and the crash kernel attached.
> 
> You will need more memory to reserve for the crash kernel because ...
> 
> > [    4.548703] Node 0 DMA free:484kB min:4kB low:4kB high:4kB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB writepending:0kB present:568kB managed:484kB mlocked:0kB kernel_stack:0kB pagetables:0kB bounce:0kB free_pcp:0kB local_pcp:0kB free_cma:0kB
> > [    4.573612] lowmem_reserve[]: 0 125 125 125
> > [    4.577799] Node 0 DMA32 free:1404kB min:1428kB low:1784kB high:2140kB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:15720kB writepending:0kB present:261560kB managed:133752kB mlocked:0kB kernel_stack:2496kB pagetables:0kB bounce:0kB free_pcp:212kB local_pcp:212kB free_cma:0kB
> 
> ... the memory is really depleted and nothing to be reclaimed (no anon.
> file pages) Look how tht free memory is below min watermark (node zone DMA has
> lowmem protection for GFP_KERNEL allocation).

We found similar issue on our side while working on kdump on SME enabled
systemd.  Kairui is working on some patches.

Actually on those SME/SEV enabled machines, swiotlb is enabled
automatically so at least we need extra 64M+ memory for kdump other
than the normal expectation.

Can you check if this is also your case?

Thanks
Dave
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
