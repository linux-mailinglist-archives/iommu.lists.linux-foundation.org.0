Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5B20CD6E
	for <lists.iommu@lfdr.de>; Mon, 29 Jun 2020 11:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CFCF8227FF;
	Mon, 29 Jun 2020 09:06:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUvGm5++M1KM; Mon, 29 Jun 2020 09:06:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44D222051D;
	Mon, 29 Jun 2020 09:06:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 280BBC08A0;
	Mon, 29 Jun 2020 09:06:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AF0E9C016E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 09:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8E24B25A5E
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 09:06:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LiGYtVDSxOZQ for <iommu@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:06:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 261E42051D
 for <iommu@lists.linux-foundation.org>; Mon, 29 Jun 2020 09:06:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73384113E;
 Mon, 29 Jun 2020 02:06:00 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0412D3F71E;
 Mon, 29 Jun 2020 02:05:57 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:05:51 +0100
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Hanjun Guo <guohanjun@huawei.com>
Subject: Re: [PATCH v2 01/12] ACPI/IORT: Make iort_match_node_callback walk
 the ACPI namespace for NC
Message-ID: <20200629090551.GA28873@e121166-lin.cambridge.arm.com>
References: <20200521130008.8266-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-1-lorenzo.pieralisi@arm.com>
 <20200619082013.13661-2-lorenzo.pieralisi@arm.com>
 <718cae1f-2f33-f6d9-f278-157300b73116@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <718cae1f-2f33-f6d9-f278-157300b73116@huawei.com>
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

On Mon, Jun 29, 2020 at 12:24:43PM +0800, Hanjun Guo wrote:
> Hi Lorenzo,
> 
> On 2020/6/19 16:20, Lorenzo Pieralisi wrote:
> > When the iort_match_node_callback is invoked for a named component
> > the match should be executed upon a device with an ACPI companion.
> > 
> > For devices with no ACPI companion set-up the ACPI device tree must be
> > walked in order to find the first parent node with a companion set and
> > check the parent node against the named component entry to check whether
> > there is a match and therefore an IORT node describing the in/out ID
> > translation for the device has been found.
> > 
> > Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Hanjun Guo <guohanjun@huawei.com>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Robin Murphy <robin.murphy@arm.com>
> > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > ---
> >   drivers/acpi/arm64/iort.c | 20 ++++++++++++++++++--
> >   1 file changed, 18 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> > index 28a6b387e80e..5eee81758184 100644
> > --- a/drivers/acpi/arm64/iort.c
> > +++ b/drivers/acpi/arm64/iort.c
> > @@ -264,15 +264,31 @@ static acpi_status iort_match_node_callback(struct acpi_iort_node *node,
> >   	if (node->type == ACPI_IORT_NODE_NAMED_COMPONENT) {
> >   		struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
> > -		struct acpi_device *adev = to_acpi_device_node(dev->fwnode);
> > +		struct acpi_device *adev;
> >   		struct acpi_iort_named_component *ncomp;
> > +		struct device *nc_dev = dev;
> > +
> > +		/*
> > +		 * Walk the device tree to find a device with an
> > +		 * ACPI companion; there is no point in scanning
> > +		 * IORT for a device matching a named component if
> > +		 * the device does not have an ACPI companion to
> > +		 * start with.
> > +		 */
> > +		do {
> > +			adev = ACPI_COMPANION(nc_dev);
> > +			if (adev)
> > +				break;
> > +
> > +			nc_dev = nc_dev->parent;
> > +		} while (nc_dev);
> 
> I'm lost here, we need the ACPI_COMPANION (the same as
> to_acpi_device_node()) of the device, but why do we need to go
> up to find the parent node?

For devices that aren't described in the DSDT - IORT translations
are determined by their ACPI parent device. Do you see/Have you
found any issue with this approach ?

> For a platform device, if I use its parent's full path name for
> its named component entry, then it will match, but this will violate
> the IORT spec.

Can you elaborate on this please I don't get the point you
are making.

Thanks,
Lorenzo
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
