Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A9D30C04D
	for <lists.iommu@lfdr.de>; Tue,  2 Feb 2021 14:55:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DD8486A14;
	Tue,  2 Feb 2021 13:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxgNnKxIoV7f; Tue,  2 Feb 2021 13:55:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A2AB863E0;
	Tue,  2 Feb 2021 13:55:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E98FCC013A;
	Tue,  2 Feb 2021 13:55:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1BB85C013A
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 16BB22046B
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:55:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cm-Trri5Sl5l for <iommu@lists.linux-foundation.org>;
 Tue,  2 Feb 2021 13:55:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 3C86020341
 for <iommu@lists.linux-foundation.org>; Tue,  2 Feb 2021 13:55:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5FB4B3D4; Tue,  2 Feb 2021 14:55:03 +0100 (CET)
Date: Tue, 2 Feb 2021 14:55:01 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/3] iommu/vt-d: Apply SATC policy
Message-ID: <20210202135501.GX32671@8bytes.org>
References: <20210202044057.615277-1-baolu.lu@linux.intel.com>
 <20210202044057.615277-4-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210202044057.615277-4-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, Ashok Raj <ashok.raj@intel.com>,
 linux-kernel@vger.kernel.org
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

On Tue, Feb 02, 2021 at 12:40:57PM +0800, Lu Baolu wrote:
> +	list_for_each_entry_rcu(satcu, &dmar_satc_units, list) {
> +		satc = container_of(satcu->hdr, struct acpi_dmar_satc, header);
> +		if (satc->segment == pci_domain_nr(dev->bus) && satcu->atc_required) {

You can safe a level of indentation and make this look nicer if you do:

		if (satc->segment != pci_domain_nr(dev->bus) || !satcu->atc_required)
			continue;


> +			for_each_dev_scope(satcu->devices, satcu->devices_cnt, i, tmp)
> +				if (to_pci_dev(tmp) == dev)
> +					goto out;
> +		}
> +	}
> +	ret = 0;
> +out:
> +	rcu_read_unlock();
> +	return ret;
> +}
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
