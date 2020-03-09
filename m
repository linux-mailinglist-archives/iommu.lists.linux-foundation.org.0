Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A1617E422
	for <lists.iommu@lfdr.de>; Mon,  9 Mar 2020 16:57:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E5AB887255;
	Mon,  9 Mar 2020 15:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ka4GMHmIls6k; Mon,  9 Mar 2020 15:57:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D57DA8723D;
	Mon,  9 Mar 2020 15:57:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9DFBC0177;
	Mon,  9 Mar 2020 15:57:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04761C0177
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 15:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E2727888E3
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 15:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubJuVZ4ySPin for <iommu@lists.linux-foundation.org>;
 Mon,  9 Mar 2020 15:57:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com
 [209.85.219.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E15C287ECD
 for <iommu@lists.linux-foundation.org>; Mon,  9 Mar 2020 15:57:22 +0000 (UTC)
Received: by mail-qv1-f68.google.com with SMTP id cz10so1173945qvb.0
 for <iommu@lists.linux-foundation.org>; Mon, 09 Mar 2020 08:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZwlGBThLg6m2J4heng9VwkAEtMMbntP9HQZ+BUWeE3E=;
 b=RictAJutNC5oHXiHm6VVPOmDBEujuzX4s9WUAcsdPVpzbrT4yECNcFl8vV6LAP1akG
 20KH/AXspCjIMvM6ElXN0c8wA7G1t+mrFUXTjijj3wbYOILnGk+tu7AXsMGcN0mwWz03
 56zSefE+TrieiUEWXly+kiVnu4aOEAZQOV+lymSL1lmNOoVDlaiUmb49f1cdea+HiPc5
 +vwAm1/NNhSdgugANUEzwf1Lxb5QSeK3w7kv+SXUNb1Gw3qSx+YCU1NlG/8Nt2lnh//H
 1OqmDp39OsMvMQb8YynsVYT6ozR7Q3FHwZ0C2FDNsLjJy5E1Z38SK6IkKO1D12y341RN
 +B4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZwlGBThLg6m2J4heng9VwkAEtMMbntP9HQZ+BUWeE3E=;
 b=P2HG1xdyLQ+gjJ+f+H6xQPfq4tSHoAdXlbKdBIaNblL/CB+gNu81gfbrTRQIFOn+pn
 MPcK5FYspg8XDMv4gbYWRZDfNvOrdi/91PiR8URw5lypYdfUnE8Bx/CsnD8JxeSuWyM3
 u5shc1tgccyQA5cymambrZ57Ol9QIVeoe92eNVXwrIm+gkqn8opbvULsi/h8NOw50YzY
 BrzfloNJsf6aZM6BB+qDOGrH2rk1BOidxO4QR9M7txO3DFxnJYhHl4pmjJSTdVdntM5X
 /On4TFrZtWMBH/r5YFBK3CbEJ0Lije11Vn8vezpvye4l1OyBVGh1bxPqAkhzmhUAkWzO
 L1Wg==
X-Gm-Message-State: ANhLgQ3ff/AkcjLuU794z30brretx4XeZMIESnSS5/AHD+v+bMqG84ca
 U70Oo5cwhucHbjsM36sFPXuPgQ==
X-Google-Smtp-Source: ADFU+vvnO2WHn6sffTAW3hxWsQyvoQ8mt/jRKIMvufo0HM41LJU+zRT1CTFD97COTD95ayDRHgxhfQ==
X-Received: by 2002:a0c:db05:: with SMTP id d5mr14829681qvk.226.1583769441612; 
 Mon, 09 Mar 2020 08:57:21 -0700 (PDT)
Received: from [192.168.1.10] (c-66-30-119-151.hsd1.ma.comcast.net.
 [66.30.119.151])
 by smtp.gmail.com with ESMTPSA id h25sm1752902qkg.87.2020.03.09.08.57.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2020 08:57:21 -0700 (PDT)
Subject: Re: [PATCH 2/2] iommu/vt-d: dmar_parse_one_rmrr: replace WARN_TAINT
 with pr_warn + add_taint
To: Hans de Goede <hdegoede@redhat.com>, David Woodhouse
 <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>
References: <20200309140138.3753-1-hdegoede@redhat.com>
 <20200309140138.3753-3-hdegoede@redhat.com>
Message-ID: <34b13929-cbea-9906-0169-8f274bd40377@google.com>
Date: Mon, 9 Mar 2020 11:57:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200309140138.3753-3-hdegoede@redhat.com>
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
From: Barret Rhoden via iommu <iommu@lists.linux-foundation.org>
Reply-To: Barret Rhoden <brho@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 3/9/20 10:01 AM, Hans de Goede wrote:
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

This patch sounds good to me.

Given the rules with WARN and external inputs, it sounds like *all* uses 
of WARN_TAINT with TAINT_FIRMWARE_WORKAROUND are bad: WARNs that are 
likely based on invalid external input.  Presumably we're working around 
FW bugs.

While we're on the subject, is WARN_TAINT() ever worth the backtrace + 
bug report?  Given the criteria is "prompt attention", it should be 
something like "nice to know about when debugging."

Thanks,

Barret


> So logging a backtrace, which invites bug reports to be filed about this,
> is not helpful.
> 
> Some distros, e.g. Fedora, have tools watching for the kernel backtraces
> logged by the WARN macros and offer the user an option to file a bug for
> this when these are encountered. The WARN_TAINT in dmar_parse_one_rmrr
> + another iommu WARN_TAINT, addressed in another patch, have lead to over
> a 100 bugs being filed this way.
> 
> This commit replaces the WARN_TAINT("...") call, with a
> pr_warn(FW_BUG "...") + add_taint(TAINT_FIRMWARE_WORKAROUND, ...) call
> avoiding the backtrace and thus also avoiding bug-reports being filed
> about this against the kernel.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1808874
> Fixes: f5a68bb0752e ("iommu/vt-d: Mark firmware tainted if RMRR fails sanity check")
> Cc: Barret Rhoden <brho@google.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   drivers/iommu/intel-iommu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 6fa6de2b6ad5..3857a5cd1a75 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -4460,14 +4460,16 @@ int __init dmar_parse_one_rmrr(struct acpi_dmar_header *header, void *arg)
>   	struct dmar_rmrr_unit *rmrru;
>   
>   	rmrr = (struct acpi_dmar_reserved_memory *)header;
> -	if (rmrr_sanity_check(rmrr))
> -		WARN_TAINT(1, TAINT_FIRMWARE_WORKAROUND,
> +	if (rmrr_sanity_check(rmrr)) {
> +		pr_warn(FW_BUG
>   			   "Your BIOS is broken; bad RMRR [%#018Lx-%#018Lx]\n"
>   			   "BIOS vendor: %s; Ver: %s; Product Version: %s\n",
>   			   rmrr->base_address, rmrr->end_address,
>   			   dmi_get_system_info(DMI_BIOS_VENDOR),
>   			   dmi_get_system_info(DMI_BIOS_VERSION),
>   			   dmi_get_system_info(DMI_PRODUCT_VERSION));
> +		add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
> +	}
>   
>   	rmrru = kzalloc(sizeof(*rmrru), GFP_KERNEL);
>   	if (!rmrru)
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
