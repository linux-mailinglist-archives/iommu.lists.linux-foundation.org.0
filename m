Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8313FF9512
	for <lists.iommu@lfdr.de>; Tue, 12 Nov 2019 17:05:50 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 86A6AD49;
	Tue, 12 Nov 2019 16:05:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6AE25D49
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 16:05:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CC0B98B1
	for <iommu@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 16:05:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 8F05C2E2; Tue, 12 Nov 2019 17:05:42 +0100 (CET)
Date: Tue, 12 Nov 2019 17:05:39 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Huang Adrian <adrianhuang0701@gmail.com>
Subject: Re: [PATCH 1/1] iommu/amd: Fix the overwritten exclusion range with
	multiple IVMDs
Message-ID: <20191112160539.GA3884@8bytes.org>
References: <20191104055852.24395-1-ahuang12@lenovo.com>
	<20191111152203.GJ18333@8bytes.org>
	<CAHKZfL2Zoj-585mHti3_ZAgUNs0s43T=fxGZYt9cKfhQMnUd3w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHKZfL2Zoj-585mHti3_ZAgUNs0s43T=fxGZYt9cKfhQMnUd3w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, Adrian Huang <ahuang12@lenovo.com>
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

On Tue, Nov 12, 2019 at 05:32:31PM +0800, Huang Adrian wrote:
> > On Mon, Nov 11, 2019 at 11:22 PM Joerg Roedel <joro@8bytes.org> wrote:

> > So there are a couple of options here:
> >
> >         1) Bail out and disable the IOMMU as the BIOS screwed up
> >
> >         2) Treat per-device exclusion ranges just as r/w unity-mapped
> >            regions.
> >
> >
> > I think option 2) is the best fix here.
> 
> Yes. This is what this patch does (The first exclusion region still
> uses the exclusion range while the remaining exclusion regions are
> modified to be r/w unity-mapped regions when detecting multiple
> exclusion regions) .

Yeah, but I think it is better to just stop using the exclusion-range
feature of the hardware (because it meand BIOSes are correct) and just
treat every exclusion range (also the first one) as an r/w unity range.

> But, I'm guessing you're talking about that BIOS has to define r/w
> unity-mapped regions instead of the per-device exclusions (Fix from
> BIOS, not prevent the failure from kernel). Right?

That would be best, but I fear this is too much to wish for.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
