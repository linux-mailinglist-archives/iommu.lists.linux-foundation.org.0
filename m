Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEA1EC2AC
	for <lists.iommu@lfdr.de>; Fri,  1 Nov 2019 13:28:38 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D0BD814AB;
	Fri,  1 Nov 2019 12:28:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 45D8A14A1
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 12:28:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id C96AF63D
	for <iommu@lists.linux-foundation.org>;
	Fri,  1 Nov 2019 12:28:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27DFB1F1;
	Fri,  1 Nov 2019 05:28:31 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
	[10.1.196.255])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22B613F6C4;
	Fri,  1 Nov 2019 05:28:30 -0700 (PDT)
Date: Fri, 1 Nov 2019 12:28:25 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 0/7] iommu: Permit modular builds of ARM SMMU[v3] drivers
Message-ID: <20191101122825.GA318@e121166-lin.cambridge.arm.com>
References: <20191030145112.19738-1-will@kernel.org>
	<6e457227-ca06-2998-4ffa-a58ab171ce32@arm.com>
	<20191030155444.GC19096@willie-the-truck>
	<CAGETcx9ogWQC1ZtnS_4xC3ShqBpuRSKudWEEWC22UZUEhdEU4A@mail.gmail.com>
	<20191031193758.GA2607492@lophozonia>
	<CAGETcx-MuMVvj0O-MFdfmLADEq=cQY_=x+irvhgwHhG4VeeSdg@mail.gmail.com>
	<20191101114148.GA2694906@lophozonia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191101114148.GA2694906@lophozonia>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
	Bjorn Helgaas <bhelgaas@google.com>, Robin Murphy <robin.murphy@arm.com>
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

On Fri, Nov 01, 2019 at 12:41:48PM +0100, Jean-Philippe Brucker wrote:

[...]

> > > I'm also wondering about ACPI support.
> > 
> > I'd love to add ACPI support too, but I have zero knowledge of ACPI.
> > I'd be happy to help anyone who wants to add ACPI support that allows
> > ACPI to add device links.
> 
> It's not as generic as device-tree, each vendor has their own table to
> describe the IOMMU topology. I don't see a nice way to transpose the
> add_links() callback there. Links need to be created either in a common
> path (iommu_probe_device()) or in the APCI IORT driver.

We can create a generic stub that calls into respective firmware
handling paths (eg iort_dma_setup() in acpi_dma_configure()).

There are three arches booting with ACPI so stubbing it out in
specific firmware handlers is not such a big deal, less generic
sure, but not catastrophically bad.

Obviously this works for IOMMU masters links - for resources
dependencies (eg power domains) it deserves some thought, keeping in
mind that IOMMUs are static table entries in ACPI and not device objects
so they are not even capable of expressing eg power resources and
suchlike.

Long story short: adding IOMMU masters links in ACPI should be
reasonably simple, everything else requires further thought.

Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
