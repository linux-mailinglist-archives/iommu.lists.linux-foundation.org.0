Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05B26E32E
	for <lists.iommu@lfdr.de>; Thu, 17 Sep 2020 20:05:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C899E8785D;
	Thu, 17 Sep 2020 18:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7itBc8Mqym6X; Thu, 17 Sep 2020 18:05:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 27D5A8788A;
	Thu, 17 Sep 2020 18:05:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 08C25C0859;
	Thu, 17 Sep 2020 18:05:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A51AC0859
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 18:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6D9D8718F
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 18:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RfnwiV5DpI8u for <iommu@lists.linux-foundation.org>;
 Thu, 17 Sep 2020 18:05:40 +0000 (UTC)
X-Greylist: delayed 00:10:05 by SQLgrey-1.7.6
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 612A687184
 for <iommu@lists.linux-foundation.org>; Thu, 17 Sep 2020 18:05:40 +0000 (UTC)
Received: from monopod.intra.ispras.ru (unknown [10.10.3.121])
 by mail.ispras.ru (Postfix) with ESMTPS id 1BB264089F1B;
 Thu, 17 Sep 2020 17:55:32 +0000 (UTC)
Date: Thu, 17 Sep 2020 20:55:32 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
In-Reply-To: <b01994db-da9b-d8e6-e0c1-1af35dd62191@amd.com>
Message-ID: <alpine.LNX.2.20.13.2009172052480.29869@monopod.intra.ispras.ru>
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

> > > Instead of blindly moving the code around to a spot that would just work,
> > > I am trying to understand what might be required here. In this case,
> > > the init_device_table_dma()should not be needed. I suspect it's the IOMMU
> > > invalidate all command that's also needed here.
> > > 
> > > I'm also checking with the HW and BIOS team. Meanwhile, could you please
> > > give
> > > the following change a try:
> > Hello. Can you give any update please?
> > 
> > Alexander
> > 
> 
> Sorry for late reply. I have a reproducer and working with the HW team to
> understand the issue.
> I should be able to provide update with solution by the end of this week.

Hello, hope you are doing well. Has this investigation found anything?

Thanks.
Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
