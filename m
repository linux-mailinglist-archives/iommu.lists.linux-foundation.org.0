Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7E020FCAB
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 21:23:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B77978798A;
	Tue, 30 Jun 2020 19:23:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uevwJkO365lD; Tue, 30 Jun 2020 19:23:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CB2387943;
	Tue, 30 Jun 2020 19:23:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8F9AC016E;
	Tue, 30 Jun 2020 19:23:08 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B288C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 19:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 158FD87943
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 19:23:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gJ2UEkwH7iS3 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 19:23:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by whitealder.osuosl.org (Postfix) with ESMTP id A722287938
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 19:23:03 +0000 (UTC)
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
 by smtp.ispras.ru (Postfix) with ESMTP id D8065201D0;
 Tue, 30 Jun 2020 22:22:55 +0300 (MSK)
Date: Tue, 30 Jun 2020 22:22:55 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
In-Reply-To: <b01994db-da9b-d8e6-e0c1-1af35dd62191@amd.com>
Message-ID: <alpine.LNX.2.20.13.2006302219240.6255@monopod.intra.ispras.ru>
References: <20200529200738.1923-1-amonakov@ispras.ru>
 <56761139-f794-39b1-4dfa-dfc05fbe5f60@amd.com>
 <alpine.LNX.2.20.13.2006011132530.16067@monopod.intra.ispras.ru>
 <dba1e37a-1ed7-ef7f-7252-2ebd1d6bde8c@amd.com>
 <alpine.LNX.2.20.13.2006152346320.21123@monopod.intra.ispras.ru>
 <b01994db-da9b-d8e6-e0c1-1af35dd62191@amd.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Tue, 16 Jun 2020, Suravee Suthikulpanit wrote:

> > > On 6/1/20 4:01 PM, Alexander Monakov wrote:
> > > > On Mon, 1 Jun 2020, Suravee Suthikulpanit wrote:
> > > > 
> > > > > > Moving init_iommu_perf_ctr just after iommu_flush_all_caches
> > > > > > resolves the issue. This is the earliest point in amd_iommu_init_pci
> > > > > > where the call succeeds on my laptop.
> > > > > According to your description, it should just need to be anywhere
> > > > > after the pci_enable_device() is called for the IOMMU device, isn't
> > > > > it? So, on your system, what if we just move the init_iommu_perf_ctr()
> > > > > here:
> > > > No, this doesn't work, as I already said in the paragraph you are
> > > > responding to. See my last sentence in the quoted part.
> > > > 
> > > > So the implication is init_device_table_dma together with subsequent
> > > > cache flush is also setting up something that is necessary for counters
> > > > to be writable.
> > > > 
> > > > Alexander
> > > > 
> > > Instead of blindly moving the code around to a spot that would just work,
> > > I am trying to understand what might be required here. In this case,
> > > the init_device_table_dma()should not be needed. I suspect it's the IOMMU
> > > invalidate all command that's also needed here.
> > > 
> > > I'm also checking with the HW and BIOS team. Meanwhile, could you please
> > > give the following change a try:
> > Hello. Can you give any update please?
> > 
> > Alexander
> > 
> 
> Sorry for late reply. I have a reproducer and working with the HW team to
> understand the issue.
> I should be able to provide update with solution by the end of this week.

Hi, can you share any information (two more weeks have passed)?

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
