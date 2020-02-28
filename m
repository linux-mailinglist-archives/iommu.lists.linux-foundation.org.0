Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D411734EF
	for <lists.iommu@lfdr.de>; Fri, 28 Feb 2020 11:05:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6FF9852F8;
	Fri, 28 Feb 2020 10:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FKDS4RHeB5t9; Fri, 28 Feb 2020 10:04:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB435851FA;
	Fri, 28 Feb 2020 10:04:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADB72C0177;
	Fri, 28 Feb 2020 10:04:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24242C0177
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D14686274
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfwsapkIAxP6 for <iommu@lists.linux-foundation.org>;
 Fri, 28 Feb 2020 10:04:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7CB4D86B9E
 for <iommu@lists.linux-foundation.org>; Fri, 28 Feb 2020 10:04:55 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 473F4246A2;
 Fri, 28 Feb 2020 10:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582884295;
 bh=FR/5YvGpv2kZqVuH1PciPnULt+xY8b1+rFsfo6eaD5Y=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=uXqmqFsAQItySKFzMVH9WkTJUEmWrpbS01RFcbL1SFD9OrLGqZky2r/m9oDttDm8u
 Zs/MrW89JgMekU7yOiAf5J372niK1hVr4DZMitZOEk5fTMdtyeD3C9drUy+56C47Ef
 SPMlzdpss6CAS+xaStd/2QzBJRDaXUZktywgIgi0=
Date: Fri, 28 Feb 2020 10:04:47 +0000
From: Will Deacon <will@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH 06/11] iommu: arm-smmu: Remove Calxeda secure mode
 quirk
Message-ID: <20200228100446.GA2395@willie-the-truck>
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-7-robh@kernel.org>
 <20200218172000.GF1133@willie-the-truck>
 <CAL_JsqJn1kG6gah+4318NQfJ4PaS3x3woWEUh08+OTfOcD+1MQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqJn1kG6gah+4318NQfJ4PaS3x3woWEUh08+OTfOcD+1MQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Langsdorf <mlangsdo@redhat.com>, kvm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>,
 "open list:LIBATA SUBSYSTEM \(Serial and Parallel ATA drivers\)"
 <linux-ide@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 soc@kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 devicetree@vger.kernel.org, Jon Loeliger <jdl@jdl.com>,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 Andre Przywara <andre.przywara@arm.com>,
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

On Tue, Feb 25, 2020 at 04:01:54PM -0600, Rob Herring wrote:
> On Tue, Feb 18, 2020 at 11:20 AM Will Deacon <will@kernel.org> wrote:
> >
> > On Tue, Feb 18, 2020 at 11:13:16AM -0600, Rob Herring wrote:
> > > Cc: Will Deacon <will@kernel.org>
> > > Cc: Robin Murphy <robin.murphy@arm.com>
> > > Cc: Joerg Roedel <joro@8bytes.org>
> > > Cc: iommu@lists.linux-foundation.org
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > Do not apply yet.
> >
> > Pleeeeease? ;)
> >
> > >  drivers/iommu/arm-smmu-impl.c | 43 -----------------------------------
> > >  1 file changed, 43 deletions(-)
> >
> > Yes, I'm happy to get rid of this. Sadly, I don't think we can remove
> > anything from 'struct arm_smmu_impl' because most implementations fall
> > just short of perfect.
> >
> > Anyway, let me know when I can push the button and I'll queue this in
> > the arm-smmu tree.
> 
> Seems we're leaving the platform support for now, but I think we never
> actually enabled SMMU support. It's not in the dts either in mainline
> nor the version I have which should be close to what shipped in
> firmware. So as long as Andre agrees, this one is good to apply.

Andre? Can I queue this one for 5.7, please?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
