Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 856E617EE23
	for <lists.iommu@lfdr.de>; Tue, 10 Mar 2020 02:44:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30250871EA;
	Tue, 10 Mar 2020 01:44:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LU32M3ey_qV1; Tue, 10 Mar 2020 01:44:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1F8787152;
	Tue, 10 Mar 2020 01:44:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9ACFC1D8E;
	Tue, 10 Mar 2020 01:44:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DE35C0177
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 01:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A498888B0
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 01:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcfqawHPC5ga for <iommu@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 01:44:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BE81F888AC
 for <iommu@lists.linux-foundation.org>; Tue, 10 Mar 2020 01:44:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 18:44:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,535,1574150400"; d="scan'208";a="235774619"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.215.55])
 ([10.254.215.55])
 by fmsmga008.fm.intel.com with ESMTP; 09 Mar 2020 18:44:10 -0700
Subject: Re: [PATCH 1/2] iommu/vt-d: dmar: replace WARN_TAINT with pr_warn +
 add_taint
To: Hans de Goede <hdegoede@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Joerg Roedel <joro@8bytes.org>
References: <20200309140138.3753-1-hdegoede@redhat.com>
 <20200309140138.3753-2-hdegoede@redhat.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <65bf12cc-0cf8-40e6-678b-b7b6775a3bf2@linux.intel.com>
Date: Tue, 10 Mar 2020 09:44:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200309140138.3753-2-hdegoede@redhat.com>
Content-Language: en-US
Cc: iommu@lists.linux-foundation.org, stable@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020/3/9 22:01, Hans de Goede wrote:
> Quoting from the comment describing the WARN functions in
> include/asm-generic/bug.h:
> 
>   * WARN(), WARN_ON(), WARN_ON_ONCE, and so on can be used to report
>   * significant kernel issues that need prompt attention if they should ever
>   * appear at runtime.
>   *
>   * Do not use these macros when checking for invalid external inputs
> 
> The (buggy) firmware tables which the dmar code was calling WARN_TAINT
> for really are invalid external inputs. They are not under the kernel's
> control and the issues in them cannot be fixed by a kernel update.
> So logging a backtrace, which invites bug reports to be filed about this,
> is not helpful.
> 
> Some distros, e.g. Fedora, have tools watching for the kernel backtraces
> logged by the WARN macros and offer the user an option to file a bug for
> this when these are encountered. The WARN_TAINT in warn_invalid_dmar()
> + another iommu WARN_TAINT, addressed in another patch, have lead to over
> a 100 bugs being filed this way.
> 
> This commit replaces the WARN_TAINT("...") calls, with
> pr_warn(FW_BUG "...") + add_taint(TAINT_FIRMWARE_WORKAROUND, ...) calls
> avoiding the backtrace and thus also avoiding bug-reports being filed
> about this against the kernel.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1564895
> Fixes: e625b4a95d50 ("iommu/vt-d: Parse ANDD records")
> Fixes: fd0c8894893c ("intel-iommu: Set a more specific taint flag for invalid BI
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu

> ---
>   drivers/iommu/dmar.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/dmar.c b/drivers/iommu/dmar.c
> index 071bb42bbbc5..87194a46cb0b 100644
> --- a/drivers/iommu/dmar.c
> +++ b/drivers/iommu/dmar.c
> @@ -440,12 +440,13 @@ static int __init dmar_parse_one_andd(struct acpi_dmar_header *header,
>   
>   	/* Check for NUL termination within the designated length */
>   	if (strnlen(andd->device_name, header->length - 8) == header->length - 8) {
> -		WARN_TAINT(1, TAINT_FIRMWARE_WORKAROUND,
> +		pr_warn(FW_BUG
>   			   "Your BIOS is broken; ANDD object name is not NUL-terminated\n"
>   			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
>   			   dmi_get_system_info(DMI_BIOS_VENDOR),
>   			   dmi_get_system_info(DMI_BIOS_VERSION),
>   			   dmi_get_system_info(DMI_PRODUCT_VERSION));
> +		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
>   		return -EINVAL;
>   	}
>   	pr_info("ANDD device: %x name: %s\n", andd->device_number,
> @@ -471,14 +472,14 @@ static int dmar_parse_one_rhsa(struct acpi_dmar_header *header, void *arg)
>   			return 0;
>   		}
>   	}
> -	WARN_TAINT(
> -		1, TAINT_FIRMWARE_WORKAROUND,
> +	pr_warn(FW_BUG
>   		"Your BIOS is broken; RHSA refers to non-existent DMAR unit at %llx\n"
>   		"BIOS vendor: %s; Ver: %s; Product Version: %s\n",
>   		drhd->reg_base_addr,
>   		dmi_get_system_info(DMI_BIOS_VENDOR),
>   		dmi_get_system_info(DMI_BIOS_VERSION),
>   		dmi_get_system_info(DMI_PRODUCT_VERSION));
> +	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
>   
>   	return 0;
>   }
> @@ -827,14 +828,14 @@ int __init dmar_table_init(void)
>   
>   static void warn_invalid_dmar(u64 addr, const char *message)
>   {
> -	WARN_TAINT_ONCE(
> -		1, TAINT_FIRMWARE_WORKAROUND,
> +	pr_warn_once(FW_BUG
>   		"Your BIOS is broken; DMAR reported at address %llx%s!\n"
>   		"BIOS vendor: %s; Ver: %s; Product Version: %s\n",
>   		addr, message,
>   		dmi_get_system_info(DMI_BIOS_VENDOR),
>   		dmi_get_system_info(DMI_BIOS_VERSION),
>   		dmi_get_system_info(DMI_PRODUCT_VERSION));
> +	add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
>   }
>   
>   static int __ref
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
