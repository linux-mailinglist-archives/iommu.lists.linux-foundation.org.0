Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D1E38AA6
	for <lists.iommu@lfdr.de>; Fri,  7 Jun 2019 14:49:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E698B122B;
	Fri,  7 Jun 2019 12:49:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A705B1207
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 12:48:57 +0000 (UTC)
X-Greylist: delayed 00:07:40 by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 2E99D623
	for <iommu@lists.linux-foundation.org>;
	Fri,  7 Jun 2019 12:48:57 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6DFB2B;
	Fri,  7 Jun 2019 05:41:16 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 68D3540151;
	Fri,  7 Jun 2019 05:41:15 -0700 (PDT)
Subject: Re: Device specific pass through in host systems - discuss user
	interface
To: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
References: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <3fa16135-b2bb-03b5-833a-bce8cc68f35f@arm.com>
Date: Fri, 7 Jun 2019 13:41:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F48DA796E@ORSMSX114.amr.corp.intel.com>
Content-Language: en-GB
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Shankar, Ravi V" <ravi.v.shankar@intel.com>, "Tian,
	Kevin" <kevin.tian@intel.com>, "jroedel@suse.de" <jroedel@suse.de>, "Raj,
	Ashok" <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	"Pan, Jacob jun" <jacob.jun.pan@intel.com>,
	"hch@lst.de" <hch@lst.de>, "Lu, Baolu" <baolu.lu@intel.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 07/06/2019 03:24, Prakhya, Sai Praneeth wrote:
> Hi All,
> 
> I am working on an IOMMU driver feature that allows a user to specify if the DMA from a device should be translated by IOMMU or not. Presently, we support only all devices or none mode i.e. if user specifies "iommu=pt" [X86] or "iommu.passthrough" [ARM64] through kernel command line, all the devices would be in pass through mode and we don't have per device granularity, but, we were requested by a customer to selectively put devices in pass through mode and not all.

It's interesting to see this from a fresh angle which isn't clouded by 
other SoC GPU details - thanks for the proposal! A couple more thoughts 
jump out immediately...

> Since, this feature could be generic across architectures, we thought it would be better if the user interface is discussed in the community first. We are envisioning this to be used both during boot time and runtime and hence having a kernel command line argument along with a sysfs entry are needed. So, please pour in your suggestions on how the user interface should look like to make it architecture agnostic.
> 
> 
> 1.      Have a kernel command line argument that takes a list of BDF's as an input and puts them in pass through mode
> 
> a.      Accepting BDF as an input has a downside - BDF is dynamic and could change if BIOS/OS enumerates a new device in next reboot
> 
> b.      Accepting <vendor_id:device_id> pair as an input has a downside - What to do when there are multiple such devices and user would like to put only some of them in PT mode
> 

c. Not all devices are PCI in the first place.

> 2.      Have a sysfs file which takes 1 or 0 as an input to enable/disable pass through mode. Some places that seem to be reasonable are
> 
> a.      /sys/class/iommu/dmar0/devices/
> 
> b.      /sys/kernel/iommu_groups/<id>/devices

Note that this this works out a bit tricky to actually use, since 
changing the meaning of DMA addresses under the device's feet would be 
disastrous. It can only safely take effect by unbinding and rebinding 
the driver and/or resetting the device (as a side note, this starts to 
overlap with the IOMMU-drivers-as-modules concept, and whatever solution 
to this we end up with may be helpful in making that work too). In most 
cases that's probably viable, but not every driver supports unbinding, 
and either way what if the device in question is the one hosting the 
root filesystem... :/

Robin.

> 
> I am looking for a consensus on *how the kernel command line argument should look like and path for sysfs entry*. Also, please note that if a device is put in pass through mode it won't be available for the guest and that's ok.
> 
> Regards,
> Sai
> 
> PS: Idea credits: Ashok Raj
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
