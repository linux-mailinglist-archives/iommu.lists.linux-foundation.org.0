Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D0C3063
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 11:39:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74A797C0D;
	Tue,  1 Oct 2019 09:39:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6B68C7C93
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 09:38:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 011258A0
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 09:38:58 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Oct 2019 02:38:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,570,1559545200"; d="scan'208";a="205032539"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
	by fmsmga001.fm.intel.com with SMTP; 01 Oct 2019 02:38:55 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 01 Oct 2019 12:38:54 +0300
Date: Tue, 1 Oct 2019 12:38:54 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 3/6] ACPI / utils: Introduce acpi_dev_hid_uid_match()
	helper
Message-ID: <20191001093854.GH2714@lahna.fi.intel.com>
References: <20190924193739.86133-1-andriy.shevchenko@linux.intel.com>
	<20190924193739.86133-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190924193739.86133-4-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Tue, Sep 24, 2019 at 10:37:36PM +0300, Andy Shevchenko wrote:
> There are users outside of ACPI realm which reimplementing the comparator
> function to check if the given device matches to given HID and UID.
> 
> For better utilization, introduce a helper for everyone to use.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ---
>  drivers/acpi/utils.c    | 25 +++++++++++++++++++++++++
>  include/acpi/acpi_bus.h |  2 ++
>  include/linux/acpi.h    |  6 ++++++
>  3 files changed, 33 insertions(+)
> 
> diff --git a/drivers/acpi/utils.c b/drivers/acpi/utils.c
> index dbd1c4cfd7d1..804ac0df58ec 100644
> --- a/drivers/acpi/utils.c
> +++ b/drivers/acpi/utils.c
> @@ -701,6 +701,31 @@ bool acpi_check_dsm(acpi_handle handle, const guid_t *guid, u64 rev, u64 funcs)
>  }
>  EXPORT_SYMBOL(acpi_check_dsm);
>  
> +/**
> + * acpi_dev_hid_uid_match - Match device by supplied HID and UID
> + * @adev: ACPI device to match.
> + * @hid2: Hardware ID of the device.
> + * @uid2: Unique ID of the device, pass NULL to not check _UID.
> + *
> + * Matches HID and UID in @adev with given @hid2 and @uid2.
> + * Returns true if matches.
> + */
> +bool acpi_dev_hid_uid_match(struct acpi_device *adev,
> +			    const char *hid2, const char *uid2)
> +{
> +	const char *hid1 = acpi_device_hid(adev);
> +	const char *uid1 = acpi_device_uid(adev);
> +
> +	if (strcmp(hid1, hid2))
> +		return false;
> +
> +	if (!uid2)
> +		return true;
> +
> +	return uid1 && !strcmp(uid1, uid2);
> +}
> +EXPORT_SYMBOL(acpi_dev_hid_uid_match);

Should this be _GPL?

In any case looks good,

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
