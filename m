Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C0C2AAF78
	for <lists.iommu@lfdr.de>; Mon,  9 Nov 2020 03:28:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 41E558677F;
	Mon,  9 Nov 2020 02:28:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9GiDpt7Otvkj; Mon,  9 Nov 2020 02:28:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7DBF08675E;
	Mon,  9 Nov 2020 02:28:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6F84FC016F;
	Mon,  9 Nov 2020 02:28:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84BA0C016F
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 02:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7987D85BB5
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 02:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97nTC5D07pUO for <iommu@lists.linux-foundation.org>;
 Mon,  9 Nov 2020 02:28:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7C99885B78
 for <iommu@lists.linux-foundation.org>; Mon,  9 Nov 2020 02:28:12 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id s30so10259334lfc.4
 for <iommu@lists.linux-foundation.org>; Sun, 08 Nov 2020 18:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3k3rzhXGnCavdgR7PU+xYV8G0+6UcvU+HiFcuDdSrD4=;
 b=CfhJd3s8xF3/QjuQfFs0lAj9QelLCvpOfvWTqGAuqWsu26wDrrcKot93DWFpewtQ4j
 IFntnuMsIuV2/MB9SOBD1pASEomJ6vk44mZoHaDVZD8LmjR1QlSwka7kdDTk6vyb1CUL
 3s/uCOkBz8EYld41If9/Tn6lQltU+NdrcvR0UUxJuWf82/SJaGhLJRc3nIN3iTbVyCPJ
 e7e1WPgioCpdihJ3hJWxhgt++28ETES79ffy0GXRZtcrkPKWpn56QVEEJKelDjgvGs/Q
 3BvW7m2TY3jyvrMUBC9XMOJ4VHG6VG6W+RbhwLLgvOzzhbA5fuhsX5JN67+OoGGj8RA+
 S9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3k3rzhXGnCavdgR7PU+xYV8G0+6UcvU+HiFcuDdSrD4=;
 b=lA6SbrNNDVVg5nIF5+Qn/tN28N4gW2x/fhQ4TsfhiZYt6q2v11It91zHxwI4VF7how
 3P1cTgyom9jvtwbSNZjUD1QyEIUMBwmSqUqKHnBDBHHAQ/jypRe1lF5aFJtlij/etFkE
 uKaZo2lxoaVYeG2UjXCwRgCfT2GSl9HbxRmZaZ2f3ORhnC8d2NjiEXNaVAgvOTECSmRj
 dfflUY3G6xK3+Dksa/CdU2bM8cUUe2z71UOTy4DhYClYNEphwQEv0UfMdvDcVq6AB7Mw
 okt+m1uc7UTD6GeQ14EzxQk+x5MImk1B+30JDsZZQl8J1VSrw3EVEhc8thg595SEe+XN
 QObw==
X-Gm-Message-State: AOAM533JcuL6wMGWlff4uW8bNiti+M5OvfV5guRMgvtY9NOyoRFwmIbX
 DGr4iaD4CjZBGavU6sMBYhmCroXR/9Fdv1+n+f0=
X-Google-Smtp-Source: ABdhPJw48w+yfmG8qqdLqg95+NqCjOKWIIfqme+l87Pct7D8cIF3Sp2DiMVhArshQU5xzv6l9pR0hi9VtX4bwwoRH8o=
X-Received: by 2002:ac2:5ca3:: with SMTP id e3mr4581368lfq.591.1604888890607; 
 Sun, 08 Nov 2020 18:28:10 -0800 (PST)
MIME-Version: 1.0
References: <20201104081438.2075-1-zhenzhong.duan@gmail.com>
In-Reply-To: <20201104081438.2075-1-zhenzhong.duan@gmail.com>
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date: Mon, 9 Nov 2020 10:27:51 +0800
Message-ID: <CAFH1YnMoNJZUJr-duEvzOMzeX0sXgE41T_A6HA+2oAU8WC=ktg@mail.gmail.com>
Subject: Re: [PATCH] iommu/vt-d: avoid unnecessory panic if iommu init fail in
 tboot
To: linux-kernel <linux-kernel@vger.kernel.org>
Cc: jroedel@suse.de, x86@kernel.org, iommu@lists.linux-foundation.org,
 ning.sun@intel.com, tboot-devel@lists.sourceforge.net,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
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

+intel iommu maintainers,

Can anyone help review this patch? Thanks

Zhenzhong

On Wed, Nov 4, 2020 at 4:15 PM Zhenzhong Duan <zhenzhong.duan@gmail.com> wrote:
>
> "intel_iommu=off" command line is used to disable iommu and iommu is force
> enabled in a tboot system. Meanwhile "intel_iommu=tboot_noforce,off"
> could be used to force disable iommu in tboot for better performance.
>
> By default kernel should panic if iommu init fail in tboot for security
> reason, but it's unnecessory if we use "intel_iommu=tboot_noforce,off".
>
> Fix it by return 0 in tboot_force_iommu() so that force_on is not set.
>
> Fixes: 7304e8f28bb2 ("iommu/vt-d: Correctly disable Intel IOMMU force on")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@gmail.com>
> ---
>  arch/x86/kernel/tboot.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/arch/x86/kernel/tboot.c b/arch/x86/kernel/tboot.c
> index 992fb1415c0f..9fd4d162b331 100644
> --- a/arch/x86/kernel/tboot.c
> +++ b/arch/x86/kernel/tboot.c
> @@ -511,12 +511,9 @@ struct acpi_table_header *tboot_get_dmar_table(struct acpi_table_header *dmar_tb
>
>  int tboot_force_iommu(void)
>  {
> -       if (!tboot_enabled())
> +       if (!tboot_enabled() || intel_iommu_tboot_noforce)
>                 return 0;
>
> -       if (intel_iommu_tboot_noforce)
> -               return 1;
> -
>         if (no_iommu || swiotlb || dmar_disabled)
>                 pr_warn("Forcing Intel-IOMMU to enabled\n");
>
> --
> 2.25.1
>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
