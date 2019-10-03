Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB7CC9C02
	for <lists.iommu@lfdr.de>; Thu,  3 Oct 2019 12:18:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADAC013EE;
	Thu,  3 Oct 2019 10:18:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 08993F7E
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 10:17:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DA1291FB
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 10:17:55 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2019 03:17:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,251,1566889200"; d="scan'208";a="343624430"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
	by orsmga004.jf.intel.com with ESMTP; 03 Oct 2019 03:17:52 -0700
Received: from andy by smile with local (Exim 4.92.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1iFyBD-0007PH-2I; Thu, 03 Oct 2019 13:17:51 +0300
Date: Thu, 3 Oct 2019 13:17:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 0/6] ACPI / utils: add new helper for HID/UID match
Message-ID: <20191003101751.GE32742@smile.fi.intel.com>
References: <20191001142725.30857-1-andriy.shevchenko@linux.intel.com>
	<CAPDyKFq_HPDW5i5ND_df4GJsnaOowHWbFTkgCCOP6w9ar2uo6w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPDyKFq_HPDW5i5ND_df4GJsnaOowHWbFTkgCCOP6w9ar2uo6w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Thu, Oct 03, 2019 at 12:00:29PM +0200, Ulf Hansson wrote:
> On Tue, 1 Oct 2019 at 16:27, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > There are few users outside of ACPI realm that re-introduce a custom
> > solution to match ACPI device against HID/UID. Add a generic helper for
> > them.
> >
> > The series is supposed to go via linux-pm tree.

> I guess Rafael intend to pick this up for v5.5?

Yes, linux-pm tree is maintained by Rafael.

> In any case, for the mmc patch, feel free to add:
> 
> Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Thanks!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
