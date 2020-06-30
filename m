Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2B920F317
	for <lists.iommu@lfdr.de>; Tue, 30 Jun 2020 12:50:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AAC6086B16;
	Tue, 30 Jun 2020 10:50:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G16ISlYu6C_F; Tue, 30 Jun 2020 10:50:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5B43286BB5;
	Tue, 30 Jun 2020 10:50:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54D0BC016E;
	Tue, 30 Jun 2020 10:50:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C6BEC016E
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 67DF786BB5
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:50:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tXJiSZtFhkw9 for <iommu@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 10:49:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 76E1A86B16
 for <iommu@lists.linux-foundation.org>; Tue, 30 Jun 2020 10:49:58 +0000 (UTC)
IronPort-SDR: hnpYHpXF7hUGR0eEV1hilyJrNZz7jb5//pemAHq9/z2f3yFKzulWqdhLaJRJf0GKAsvksX9+Q2
 NXhQ0X45+3fg==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="144385494"
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="144385494"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 03:49:58 -0700
IronPort-SDR: AHCabFJYknbIO+16YmrYmksrEmbBeWSI8iMfurM3s88EU4yDaqt+uf+KCqFHe7Ejg8AvfzLXib
 7p2mDBLjdUnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,297,1589266800"; d="scan'208";a="386664591"
Received: from kuha.fi.intel.com ([10.237.72.162])
 by fmsmga001.fm.intel.com with SMTP; 30 Jun 2020 03:49:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Tue, 30 Jun 2020 13:49:48 +0300
Date: Tue, 30 Jun 2020 13:49:48 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Rajat Jain <rajatja@google.com>
Subject: Re: [PATCH v2 5/7] driver core: Add device location to "struct
 device" and expose it in sysfs
Message-ID: <20200630104948.GC856968@kuha.fi.intel.com>
References: <20200630044943.3425049-1-rajatja@google.com>
 <20200630044943.3425049-6-rajatja@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630044943.3425049-6-rajatja@google.com>
Cc: Todd Broch <tbroch@google.com>, linux-pci@vger.kernel.org,
 lalithambika.krishnakumar@intel.com, Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 Saravana Kannan <saravanak@google.com>, linux-acpi@vger.kernel.org,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 oohall@gmail.com, Benson Leung <bleung@google.com>,
 David Woodhouse <dwmw2@infradead.org>, Alex Levin <levinale@google.com>
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

On Mon, Jun 29, 2020 at 09:49:41PM -0700, Rajat Jain wrote:
> Add a new (optional) field to denote the physical location of a device
> in the system, and expose it in sysfs. This was discussed here:
> https://lore.kernel.org/linux-acpi/20200618184621.GA446639@kroah.com/
> 
> (The primary choice for attribute name i.e. "location" is already
> exposed as an ABI elsewhere, so settled for "site"). Individual buses
> that want to support this new attribute can opt-in by setting a flag in
> bus_type, and then populating the location of device while enumerating
> it.

So why not just call it "physical_location"?


thanks,

-- 
heikki
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
