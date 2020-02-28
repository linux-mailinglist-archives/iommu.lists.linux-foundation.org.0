Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6406B1735A5
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 11:51:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E2D386D55;
	Fri, 28 Feb 2020 10:50:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVQRT8DnCzSR; Fri, 28 Feb 2020 10:50:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C30DB86D9E;
	Fri, 28 Feb 2020 10:50:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B75C8C0177;
	Fri, 28 Feb 2020 10:50:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CDAAC0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 52A6720343
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0esFzXwhgzX for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:50:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 529862002A
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:50:33 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20828246A8;
 Fri, 28 Feb 2020 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582887033;
 bh=Bbgf5LWzwoyyN8sRPGs+DRNqC78Z9PpvNOKHlpYOuuY=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=z+RrJqqRtVGq9XfqtRw9QpSXbUASWNcXI/tfse0Sc/IM6Lxf9lx6pMA0oirj8lTKl
 h8CJkGoAIzMi7dfqp1Okh0a+WgaLv+aWJ83Vji5BUFGibpT6zuUmElpzm2ARQnrxn2
 jtaOyTvkzqcVrgV8nfhA2AzeOrZn4B/PQAFNxHXw=
Date: Fri, 28 Feb 2020 10:50:25 +0000
From: Will Deacon <will@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [RFC PATCH 06/11] iommu: arm-smmu: Remove Calxeda secure mode
 quirk
Message-ID: <20200228105024.GC2395@willie-the-truck>
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-7-robh@kernel.org>
 <20200218172000.GF1133@willie-the-truck>
 <CAL_JsqJn1kG6gah+4318NQfJ4PaS3x3woWEUh08+OTfOcD+1MQ@mail.gmail.com>
 <20200228100446.GA2395@willie-the-truck>
 <20200228102556.1dde016e@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200228102556.1dde016e@donnerap.cambridge.arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Langsdorf <mlangsdo@redhat.com>, kvm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, soc@kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Jon Loeliger <jdl@jdl.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Alexander Graf <graf@amazon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 linux-edac <linux-edac@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Matthias Brugger <mbrugger@suse.com>, Stephen Boyd <sboyd@kernel.org>,
 netdev <netdev@vger.kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Linux IOMMU <iommu@lists.linux-foundation.org>,
 Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>,
 Borislav Petkov <bp@alien8.de>, Robin Murphy <robin.murphy@arm.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Fri, Feb 28, 2020 at 10:25:56AM +0000, Andre Przywara wrote:
> On Fri, 28 Feb 2020 10:04:47 +0000
> Will Deacon <will@kernel.org> wrote:
> 
> Hi,
> 
> > On Tue, Feb 25, 2020 at 04:01:54PM -0600, Rob Herring wrote:
> > > On Tue, Feb 18, 2020 at 11:20 AM Will Deacon <will@kernel.org> wrote:  
> > > >
> > > > On Tue, Feb 18, 2020 at 11:13:16AM -0600, Rob Herring wrote:  
> > > > > Cc: Will Deacon <will@kernel.org>
> > > > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > > > Cc: Joerg Roedel <joro@8bytes.org>
> > > > > Cc: iommu@lists.linux-foundation.org
> > > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > > ---
> > > > > Do not apply yet.  
> > > >
> > > > Pleeeeease? ;)
> > > >  
> > > > >  drivers/iommu/arm-smmu-impl.c | 43 -----------------------------------
> > > > >  1 file changed, 43 deletions(-)  
> > > >
> > > > Yes, I'm happy to get rid of this. Sadly, I don't think we can remove
> > > > anything from 'struct arm_smmu_impl' because most implementations fall
> > > > just short of perfect.
> > > >
> > > > Anyway, let me know when I can push the button and I'll queue this in
> > > > the arm-smmu tree.  
> > > 
> > > Seems we're leaving the platform support for now, but I think we never
> > > actually enabled SMMU support. It's not in the dts either in mainline
> > > nor the version I have which should be close to what shipped in
> > > firmware. So as long as Andre agrees, this one is good to apply.  
> > 
> > Andre? Can I queue this one for 5.7, please?
> 
> I was wondering how much of a pain it is to keep it in? AFAICS there are
> other users of the "impl" indirection. If those goes away, I would be
> happy to let Calxeda go.

The impl stuff is new, so we'll keep it around. The concern is more about
testing (see below).

> But Eric had the magic DT nodes to get the SMMU working, and I used that
> before, with updating the DT either on flash or dynamically via U-Boot.

What did you actually use the SMMU for, though? The
'arm_iommu_create_mapping()' interface isn't widely used and, given that
highbank doesn't support KVM, the use-cases for VFIO are pretty limited
too.

> So I don't know exactly *how* desperate you are with removing this, or if
> there are other reasons than "negative diffstat", but if possible I would
> like to keep it in.

It's more that we *do* make quite a lot of changes to the arm-smmu driver
and it's never tested with this quirk. If you're stepping up to run smmu
tests on my queue for each release on highbank, then great, but otherwise
I'd rather not carry the code for fun. The change in diffstat is minimal
(we're going to need to hooks for nvidia, who broke things in a different
way).

Also, since the hooks aren't going away, if you /do/ end up using the SMMU
in future, then we could re-add the driver quirk without any fuss.

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
