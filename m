Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B42B17768C
	for <lists.iommu@lfdr.de>; Tue,  3 Mar 2020 14:02:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A6BEF863BE;
	Tue,  3 Mar 2020 13:02:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftMKAj5PrFGd; Tue,  3 Mar 2020 13:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 613688643F;
	Tue,  3 Mar 2020 13:02:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42C40C013E;
	Tue,  3 Mar 2020 13:02:06 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 340FCC013E;
 Tue,  3 Mar 2020 13:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1B34C204E3;
 Tue,  3 Mar 2020 13:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mB08JM3BEq4m; Tue,  3 Mar 2020 13:02:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id C847F204E0;
 Tue,  3 Mar 2020 13:02:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E1C66385; Tue,  3 Mar 2020 14:01:59 +0100 (CET)
Date: Tue, 3 Mar 2020 14:01:56 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v2 1/3] iommu/virtio: Add topology description to
 virtio-iommu config space
Message-ID: <20200303130155.GA13185@8bytes.org>
References: <20200228172537.377327-1-jean-philippe@linaro.org>
 <20200228172537.377327-2-jean-philippe@linaro.org>
 <20200302161611.GD7829@8bytes.org>
 <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9004f814-2f7c-9024-3465-6f9661b97b7a@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 mst@redhat.com, linux-pci@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com,
 robin.murphy@arm.com
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

Hi Eric,

On Tue, Mar 03, 2020 at 11:19:20AM +0100, Auger Eric wrote:
> Michael has pushed this solution (putting the "configuration in the PCI
> config space"), I think for those main reasons:
> - ACPI may not be supported on some archs/hyps

But on those there is device-tree, right?

> - the virtio-iommu is a PCIe device so binding should not need ACPI
> description

The other x86 IOMMUs are PCI devices too and they definitly need a ACPI
table to be configured.

> Another issue with ACPI integration is we have different flavours of
> tables that exist: IORT, DMAR, IVRS

An integration with IORT might be the best, but if it is not possible
ther can be a new table-type for Virtio-iommu. That would still follow
platform best practices.

> x86 ACPI integration was suggested with IORT. But it seems ARM is
> reluctant to extend IORT to support para-virtualized IOMMU. So the VIOT
> was proposed as a different atternative in "[RFC 00/13] virtio-iommu on
> non-devicetree platforms"
> (https://patchwork.kernel.org/cover/11257727/). Proposing a table that
> may be used by different vendors seems to be a challenging issue here.

Yeah, if I am reading that right this proposes a one-fits-all solution.
That is not needed as the other x86 IOMMUs already have their tables
defined and implemented. There is no need to change anything there.

> So even if the above solution does not look perfect, it looked a
> sensible compromise given the above arguments. Please could you explain
> what are the most compelling arguments against it?

It is a hack and should be avoided if at all possible. And defining an
own ACPI table type seems very much possible.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
