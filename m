Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA7320F29C
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:25:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC2AA8855C;
	Tue, 30 Jun 2020 10:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGtXZm4yDkmQ; Tue, 30 Jun 2020 10:25:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1C2DC88553;
	Tue, 30 Jun 2020 10:25:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04320C016E;
	Tue, 30 Jun 2020 10:25:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86E91C016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7523F87D9D
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ViURGX4RjGWs for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:25:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3253187722
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:25:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9943C31B;
 Tue, 30 Jun 2020 03:25:02 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 66CC53F68F;
 Tue, 30 Jun 2020 03:25:00 -0700 (PDT)
Date: Tue, 30 Jun 2020 11:24:54 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v2 01/12] ACPI/IORT: Make iort_match_node_callback walk
 the ACPI namespace for NC
Message-ID: <20200630102454.GA17556@e121166-lin.cambridge.arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-2-lorenzo.pieralisi@arm.com>
 <718cae1f-2f33-f6d9-f278-157300b73116@huawei.com>
 <20200629090551.GA28873@e121166-lin.cambridge.arm.com>
 <765078e7-b3ec-af5d-0405-7834ba0f120a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <765078e7-b3ec-af5d-0405-7834ba0f120a@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Makarand Pawagi <makarand.pawagi@nxp.com>, linux-pci@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Robin Murphy <robin.murphy@arm.com>,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, Jun 30, 2020 at 11:06:41AM +0800, Hanjun Guo wrote:

[...]

> > For devices that aren't described in the DSDT - IORT translations
> > are determined by their ACPI parent device. Do you see/Have you
> > found any issue with this approach ?
> 
> The spec says "Describes the IO relationships between devices
> represented in the ACPI namespace.", and in section 3.1.1.3 Named
> component node, it says:

PCI devices aren't necessarily described in the ACPI namespace and we
still use IORT to describe them - through the RC node.

> "Named component nodes are used to describe devices that are also
> included in the Differentiated System Description Table (DSDT). See
> [ACPI]."
> 
> So from my understanding, the IORT spec for now, can only do ID
> translations for devices in the DSDT.

I think you can read this multiple ways but this patch does not
change this concept. What changes, is applying parent's node IORT
mapping to child nodes with no associated DSDT nodes, it is the
same thing we do with PCI and the _DMA method - we could update
the wording in the specs if that clarifies but I don't think this
deliberately disregards the specifications.

> > > For a platform device, if I use its parent's full path name for
> > > its named component entry, then it will match, but this will violate
> > > the IORT spec.
> > 
> > Can you elaborate on this please I don't get the point you
> > are making.
> 
> For example, device A is not described in DSDT so can't represent
> as a NC node in IORT. Device B can be described in DSDT and it
> is the parent of device A, so device B can be represented in IORT
> with memory access properties and node flags with Substream width
> and Stall supported info.
> 
> When we trying to translate device A's ID, we reuse all the memory
> access properties and node flags from its parent (device B), but
> will it the same?

I assume so why wouldn't it be ? Why would be describe them in
a parent-child relationship if that's not how the system looks like
in HW ?

Do you have a specific example in mind that we should be aware of ?

> So the IORT spec don't support this, at least it's pretty vague
> I think.

I think that's a matter of wording, it can be updated if it needs be,
reach out if you see any issue with the current approach please.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
