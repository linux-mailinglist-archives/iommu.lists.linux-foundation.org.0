Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DF0A51EA
	for <lists.iommu@lfdr.de>; Mon,  2 Sep 2019 10:38:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 05CC0CDB;
	Mon,  2 Sep 2019 08:38:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17115CC7
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 08:38:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B0D955D3
	for <iommu@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 08:38:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 01:38:02 -0700
X-IronPort-AV: E=Sophos;i="5.64,457,1559545200"; d="scan'208";a="184442382"
Received: from jkrzyszt-desk.ger.corp.intel.com ([172.22.244.17])
	by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Sep 2019 01:38:00 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH] iommu/vt-d: Fix IOMMU field not populated on device
	hot re-plug
Date: Mon, 02 Sep 2019 10:37:41 +0200
Message-ID: <1769080.0GM3UzqXcv@jkrzyszt-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
	80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ccb1434d-281c-abae-0726-7fd924041315@linux.intel.com>
References: <20190822142922.31526-1-janusz.krzysztofik@linux.intel.com>
	<3255251.C7nBVfOIaa@jkrzyszt-desk.ger.corp.intel.com>
	<ccb1434d-281c-abae-0726-7fd924041315@linux.intel.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>, intel-gfx@lists.freedesktop.org,
	=?utf-8?B?TWljaGHFgg==?= Wajdeczko <michal.wajdeczko@intel.com>
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

Hi Baolu,

On Thursday, August 29, 2019 11:08:18 AM CEST Lu Baolu wrote:
> Hi,
> 
> On 8/29/19 3:58 PM, Janusz Krzysztofik wrote:
> > Hi Baolu,
> > 
> > On Thursday, August 29, 2019 3:43:31 AM CEST Lu Baolu wrote:
> >> Hi Janusz,
> >>
> >> On 8/28/19 10:17 PM, Janusz Krzysztofik wrote:
> >>>> We should avoid kernel panic when a intel_unmap() is called against
> >>>> a non-existent domain.
> >>> Does that mean you suggest to replace
> >>> 	BUG_ON(!domain);
> >>> with something like
> >>> 	if (WARN_ON(!domain))
> >>> 		return;
> >>> and to not care of orphaned mappings left allocated?  Is there a way to
> > inform
> >>> users that their active DMA mappings are no longer valid and they
> > shouldn't
> >>> call dma_unmap_*()?
> >>>
> >>>> But we shouldn't expect the IOMMU driver not
> >>>> cleaning up the domain info when a device remove notification comes and
> >>>> wait until all file descriptors being closed, right?
> >>> Shouldn't then the IOMMU driver take care of cleaning up resources still
> >>> allocated on device remove before it invalidates and forgets their
> > pointers?
> >>>
> >>
> >> You are right. We need to wait until all allocated resources (iova and
> >> mappings) to be released.
> >>
> >> How about registering a callback for BUS_NOTIFY_UNBOUND_DRIVER, and
> >> removing the domain info when the driver detachment completes?
> > 
> > Device core calls BUS_NOTIFY_UNBOUND_DRIVER on each driver unbind, 
regardless
> > of a device being removed or not.  As long as the device is not unplugged 
and
> > the BUS_NOTIFY_REMOVED_DEVICE notification not generated, an unbound 
driver is
> > not a problem here.
> > Morever, BUS_NOTIFY_UNBOUND_DRIVER  is called even before
> > BUS_NOTIFY_REMOVED_DEVICE so that wouldn't help anyway.
> > Last but not least, bus events are independent of the IOMMU driver use via
> > DMA-API it exposes.
> 
> Fair enough.
> 
> > 
> > If keeping data for unplugged devices and reusing it on device re-plug is 
not
> > acceptable then maybe the IOMMU driver should perform reference counting 
of
> > its internal resources occupied by DMA-API users and perform cleanups on 
last
> > release?
> 
> I am not saying that keeping data is not acceptable. I just want to
> check whether there are any other solutions.

Then reverting 458b7c8e0dde and applying this patch still resolves the issue 
for me.  No errors appear when mappings are unmapped on device close after the 
device has been removed, and domain info preserved on device removal is 
successfully reused on device re-plug.

Is there anything else I can do to help?

Thanks,
Janusz

> 
> Best regards,
> Baolu
> 




_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
