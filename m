Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5413162CF1
	for <lists.iommu@lfdr.de>; Tue, 18 Feb 2020 18:32:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60B4385B81;
	Tue, 18 Feb 2020 17:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bm5J14E4A9FP; Tue, 18 Feb 2020 17:32:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6E9A85B4A;
	Tue, 18 Feb 2020 17:32:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB054C013E;
	Tue, 18 Feb 2020 17:32:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1066C013E
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9995A85D22
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lDigq2HY3RjQ for <iommu@lists.linux-foundation.org>;
 Tue, 18 Feb 2020 17:32:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by hemlock.osuosl.org (Postfix) with ESMTP id AD43182476
 for <iommu@lists.linux-foundation.org>; Tue, 18 Feb 2020 17:32:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F5C131B;
 Tue, 18 Feb 2020 09:32:29 -0800 (PST)
Received: from [10.1.196.37] (e121345-lin.cambridge.arm.com [10.1.196.37])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13CAC3F703;
 Tue, 18 Feb 2020 09:32:24 -0800 (PST)
Subject: Re: [RFC PATCH 06/11] iommu: arm-smmu: Remove Calxeda secure mode
 quirk
To: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>
References: <20200218171321.30990-1-robh@kernel.org>
 <20200218171321.30990-7-robh@kernel.org>
 <20200218172000.GF1133@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <38be84e3-d23f-1e91-4d3d-87fc11d7c089@arm.com>
Date: Tue, 18 Feb 2020 17:32:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200218172000.GF1133@willie-the-truck>
Content-Language: en-GB
Cc: Mark Langsdorf <mlangsdo@redhat.com>, kvm@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-ide@vger.kernel.org,
 linux-clk@vger.kernel.org, soc@kernel.org,
 Daniel Lezcano <daniel.lezcano@linaro.org>, devicetree@vger.kernel.org,
 Jon Loeliger <jdl@jdl.com>, linux-pm@vger.kernel.org,
 Andre Przywara <andre.przywara@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Tony Luck <tony.luck@intel.com>,
 Alexander Graf <graf@amazon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Matthias Brugger <mbrugger@suse.com>,
 Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
 Cornelia Huck <cohuck@redhat.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Robert Richter <rrichter@marvell.com>, James Morse <james.morse@arm.com>,
 Borislav Petkov <bp@alien8.de>, "David S. Miller" <davem@davemloft.net>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 18/02/2020 5:20 pm, Will Deacon wrote:
> On Tue, Feb 18, 2020 at 11:13:16AM -0600, Rob Herring wrote:
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Robin Murphy <robin.murphy@arm.com>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: iommu@lists.linux-foundation.org
>> Signed-off-by: Rob Herring <robh@kernel.org>
>> ---
>> Do not apply yet.
> 
> Pleeeeease? ;)
> 
>>   drivers/iommu/arm-smmu-impl.c | 43 -----------------------------------

Presumably we also want to remove the definition of the option from 
binding too.

>>   1 file changed, 43 deletions(-)
> 
> Yes, I'm happy to get rid of this. Sadly, I don't think we can remove
> anything from 'struct arm_smmu_impl' because most implementations fall
> just short of perfect.

Right, this served as the prototype for register access hooks, but we 
have at least one other known user for those.

> Anyway, let me know when I can push the button and I'll queue this in
> the arm-smmu tree.

FWIW the quirk has proven useful in other circumstances too, but I 
imagine if we ever have to prototype an integration on VExpress-CA9 
again, reverting this patch will hardly be the most unpleasant part :)

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
