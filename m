Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F345BA62D9
	for <lists.iommu@lfdr.de>; Tue,  3 Sep 2019 09:41:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ECDF4CA6;
	Tue,  3 Sep 2019 07:41:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C352C9E
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:41:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 91AE3709
	for <iommu@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 07:41:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 00:41:48 -0700
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="176505229"
Received: from jkrzyszt-desk.igk.intel.com (HELO
	jkrzyszt-desk.ger.corp.intel.com) ([172.22.244.17])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 00:41:45 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [RFC PATCH] iommu/vt-d: Fix IOMMU field not populated on device
	hot re-plug
Date: Tue, 03 Sep 2019 09:41:23 +0200
Message-ID: <2674326.ZPvzKFr69O@jkrzyszt-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
	80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <52fbfac9-c879-4b45-dd74-fafe62c2432b@linux.intel.com>
References: <20190822142922.31526-1-janusz.krzysztofik@linux.intel.com>
	<1769080.0GM3UzqXcv@jkrzyszt-desk.ger.corp.intel.com>
	<52fbfac9-c879-4b45-dd74-fafe62c2432b@linux.intel.com>
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

On Tuesday, September 3, 2019 3:29:40 AM CEST Lu Baolu wrote:
> Hi Janusz,
> 
> On 9/2/19 4:37 PM, Janusz Krzysztofik wrote:
> >> I am not saying that keeping data is not acceptable. I just want to
> >> check whether there are any other solutions.
> > Then reverting 458b7c8e0dde and applying this patch still resolves the 
issue
> > for me.  No errors appear when mappings are unmapped on device close after 
the
> > device has been removed, and domain info preserved on device removal is
> > successfully reused on device re-plug.
> 
> This patch doesn't look good to me although I agree that keeping data is
> acceptable. It updates dev->archdata.iommu, but leaves the hardware
> context/pasid table unchanged. This might cause problems somewhere.
> 
> > 
> > Is there anything else I can do to help?
> 
> Can you please tell me how to reproduce the problem? 

The most simple way to reproduce the issue, assuming there are no non-Intel 
graphics adapters installed, is to run the following shell commands:

#!/bin/sh
# load i915 module
modprobe i915
# open an i915 device and keep it open in background
cat /dev/dri/card0 >/dev/null &
sleep 2
# simulate device unplug
echo 1 >/sys/class/drm/card0/device/remove
# make the background process close the device on exit
kill $!

Thanks,
Janusz


> Keeping the per
> device domain info while device is unplugged is a bit dangerous because
> info->dev might be a wild pointer. We need to work out a clean fix.
> 
> > 
> > Thanks,
> > Janusz
> > 
> 
> Best regards,
> Baolu
> 




_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
