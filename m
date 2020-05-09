Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DE81CC0DD
	for <lists.iommu@lfdr.de>; Sat,  9 May 2020 13:22:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5837B88021;
	Sat,  9 May 2020 11:22:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3icns-wtM3xx; Sat,  9 May 2020 11:22:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC7EC8769F;
	Sat,  9 May 2020 11:22:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BAC81C07FF;
	Sat,  9 May 2020 11:22:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EE67C07FF
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 11:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 06E6B8898E
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 11:22:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shBPi91jVCM6 for <iommu@lists.linux-foundation.org>;
 Sat,  9 May 2020 11:22:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6C89088639
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 11:22:12 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id k7so471620pjs.5
 for <iommu@lists.linux-foundation.org>; Sat, 09 May 2020 04:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nc0J+alQfOrvgwIOBD8elSqmi3vnePVNZdws8SziVdQ=;
 b=s/yXFOFLCfVR6jEU6GzFIKNNpotAKDJUK8b99OGXLCIjN/6huyEwt3Cd9Yw3Mtm71U
 hH2qaX6gQSZ1pIaEgH37SHvQncbLrulga2SZDgUMzCw0awTWOuBnfLIOrTkf+NNH+w1X
 /pLd/PMubOFlh1/Vvws3zf+ZsrrWEOGNCAvPsEY291MZ6G0FPA06RfKVO+pmJSkcuFAS
 Ko5u1eJryTQyBXqeWktV8sBGk4/k3glhbpNKZoxnvBunpNOpHrThP0MVjjha1i5VQ34A
 qzNIicBHLtCoeGqQP/HoDutdZTVPmyuKetkN7bA3Oa1wrN70wg/PrlD6xg9Ci6GJ9wBv
 xy6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nc0J+alQfOrvgwIOBD8elSqmi3vnePVNZdws8SziVdQ=;
 b=jaKofWhW5t3GN23qBxNSe66Yk8l7d6eEdm0GK8TaOhUtCdOVHfUIC2cIEc/2sCusSF
 gR20JO0StPXfaM+C8b5tJ30zH1d0vaOk19KGCvVvuYFodBlHdsOv48MmrRqqCjIqVDQp
 azkxTNEAEAFfe/QgWkPM3q0U3YOsaJGNuDozm168dv5/2h1nfS5hbqlimZwzZCZ5HT/T
 mKXnkpHbZ6gqfTEyLajlFnCCLJeLUyt2M7cPkLplTTVt5tTAMIeT6koNLa+S5eI31brA
 4K58f197zNvkeFpaEjKke0Uig+tpyPoP5NbbUzBrqE38kYHtLo6VtE0HmUuhYpgk+vDF
 0sqQ==
X-Gm-Message-State: AGi0PuY7RPce1KKmdn5V+QhxpBYrCwKZOWhRWakPcygl40pCZn8BCj/j
 U+A/SJqc7yXQRjPn1G1WV04BD+wfEO6k+3MUXs0=
X-Google-Smtp-Source: APiQypLqaOrW/kTHlmjah1lQ7VugqF1t6VsA1s5ASMnzgFEDI6a6f6vRMXehV0/h2i/GCrTb1m0ZRADj9jNrMe4iKTg=
X-Received: by 2002:a17:90b:94a:: with SMTP id
 dw10mr11230982pjb.228.1589023331915; 
 Sat, 09 May 2020 04:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200508164819.1.I6f1b6f973ee6c8af1348611370c73a0ec0ea53f1@changeid>
In-Reply-To: <20200508164819.1.I6f1b6f973ee6c8af1348611370c73a0ec0ea53f1@changeid>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 9 May 2020 14:22:00 +0300
Message-ID: <CAHp75VfF-y6GSrFKMx75b756jiO+0KtJUpa2X=778XVvoTh5dg@mail.gmail.com>
Subject: Re: [PATCH] iommu/amd: Fix get_acpihid_device_id
To: Raul E Rangel <rrangel@chromium.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Joerg Roedel <jroedel@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Kurtz <djkurtz@chromium.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Evan Green <evgreen@chromium.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

On Sat, May 9, 2020 at 1:50 AM Raul E Rangel <rrangel@chromium.org> wrote:
>
> acpi_dev_hid_uid_match expects a null pointer for UID if it doesn't

acpi_dev_hid_uid_match()

> exist. The acpihid_map_entry contains a char buffer for holding the
> UID. If no UID was provided in the IVRS table, this buffer will be
> zeroed. If we pass in a null string, acpi_dev_hid_uid_match will return

acpi_dev_hid_uid_match()

> false because it will try and match an empty string to the ACPI UID of
> the device.

Thank you for testing and producing a patch! My comments below, after addressing

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

>
> Fixes: ae5e6c6439c3 ("iommu/amd: Switch to use acpi_dev_hid_uid_match()")

Suggested-by?

> Signed-off-by: Raul E Rangel <rrangel@chromium.org>



> ---
>
>  drivers/iommu/amd_iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
> index 20cce366e951..06f603366cb1 100644
> --- a/drivers/iommu/amd_iommu.c
> +++ b/drivers/iommu/amd_iommu.c
> @@ -125,7 +125,8 @@ static inline int get_acpihid_device_id(struct device *dev,
>                 return -ENODEV;
>
>         list_for_each_entry(p, &acpihid_map, list) {
> -               if (acpi_dev_hid_uid_match(adev, p->hid, p->uid)) {
> +               if (acpi_dev_hid_uid_match(adev, p->hid,
> +                                          p->uid[0] ? p->uid : NULL)) {

I would still use *p->uid as done in other places in the driver and
put this all on one line (however, the latter is complete style
preference depending on maintainer's choice)

>                         if (entry)
>                                 *entry = p;
>                         return p->devid;
> --
> 2.26.2.645.ge9eca65c58-goog
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
