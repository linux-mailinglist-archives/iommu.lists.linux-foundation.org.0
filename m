Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F82A7553
	for <lists.iommu@lfdr.de>; Thu,  5 Nov 2020 03:20:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 399A184FB0;
	Thu,  5 Nov 2020 02:19:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XzQ98OtKRIFu; Thu,  5 Nov 2020 02:19:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEC4084FA5;
	Thu,  5 Nov 2020 02:19:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B0A4C0889;
	Thu,  5 Nov 2020 02:19:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08F18C0889
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 02:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E316487005
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 02:19:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-hXxSNUcWKA for <iommu@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 02:19:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0A6A086FFB
 for <iommu@lists.linux-foundation.org>; Thu,  5 Nov 2020 02:19:56 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id o13so564779ljj.11
 for <iommu@lists.linux-foundation.org>; Wed, 04 Nov 2020 18:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7skSxIX4H4ERr2KWMBBNL6BPLI6dS/H7sqa5OXUDuu0=;
 b=QNv/w7aH0oP53J3Y59bUHS48Xks3iYgOQfXV54369dx1Z6kHPJDwCpizgx06CCZ4kn
 Tel6OfCmM9bunMFLvXtfH/QP7HzUoUIz+d02Fi3t+zfEgl5Ti6i8emrafuPWQ2TWowWV
 ihxcezBfT4TUDzZIcjP+IIfbbV15tJEP0gKwg6KL05QNOvgUCmAreZrxlGJAyGA9KtLV
 k3uc3fWqbOMMGbGCUi/eA8wTUZiPXWYJ+uUCFw4w8cna6uaf79YmbZ7iikDRCpBKUCXe
 KPPIsh7JPw+DludHrM6XU8uSwH2VdigxiALfsLR9CwBI/NI9ZKT2vI0LPbNgxV3dz8Cz
 ibNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7skSxIX4H4ERr2KWMBBNL6BPLI6dS/H7sqa5OXUDuu0=;
 b=cM6t1logxVvkX3AnyPuKB7zqQRG4Pyb9mHondA0rPtG8awoBD/2Vls8kATLClEozX8
 iWBjYvPyUoNOQhIBbalYgzFEJuxzWKPh4J8Lm/IKK1AUr8nnamvvo24vfRHe39RDod2t
 jWUoWcgNTYieO1fxY8y9haF9nub6bIJ+rZzS2xY6Vi43EkyXaPI109VgKtl9y84vj5n0
 5/M5gM6KRm/H9iaRZUlkOKlw6P3WEr8pQOklfBe0aGQjcfjRrR0BfyiOwF8Zv6doEVbI
 qqQVIllfm4A1OiwUoSUMKcnExqEswVbyHUiWP1vxCCLQyWAnEIaCjEaNa1GC3mpraW8b
 JLCQ==
X-Gm-Message-State: AOAM531vHMbBltlXDORvQBqLTeyRy92kkzUR4/dUQwiUB4cXjhX4DNtB
 S4JGrF0B83CQ+w/67ChE14XwP00IfhuSb9sbxII=
X-Google-Smtp-Source: ABdhPJyusyBDGoC19aOti8XmQ85ELZMMzFwcU3LfkkNwF9bElNSWBL+4PwUw8N/q+Q1F9BeNRBHR6dTfuNASqM7FnsA=
X-Received: by 2002:a2e:6c11:: with SMTP id h17mr40022ljc.432.1604542794148;
 Wed, 04 Nov 2020 18:19:54 -0800 (PST)
MIME-Version: 1.0
References: <20201104081936.2128-1-zhenzhong.duan@gmail.com>
 <67fd98a2-23a9-b69a-4d60-a0698e243a85@linux.intel.com>
In-Reply-To: <67fd98a2-23a9-b69a-4d60-a0698e243a85@linux.intel.com>
From: Zhenzhong Duan <zhenzhong.duan@gmail.com>
Date: Thu, 5 Nov 2020 10:19:36 +0800
Message-ID: <CAFH1YnO4xas=YnUSYR3MjxRkFPvezHe7Rt4cdgZU4knvvQqzEA@mail.gmail.com>
Subject: Re: [PATCH] iommu/vt-d: remove redundant variable no_platform_optin
To: Lu Baolu <baolu.lu@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org
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

Hi Baolu,

On Thu, Nov 5, 2020 at 9:47 AM Lu Baolu <baolu.lu@linux.intel.com> wrote:
>
> Hi Zhenzhong,
>
> On 11/4/20 4:19 PM, Zhenzhong Duan wrote:
> > no_platform_optin is redundant with dmar_disabled and it's only used in
> > platform_optin_force_iommu(), remove it and use dmar_disabled instead.
>
> It's actually not.
>
> If CONFIG_INTEL_IOMMU_DEFAULT_ON is not set, we will get "dmar_disable =
> 1" and "no_platform_optin = 0". In this case, we must force the iommu on
> and set dmar_disable = 0.
>
> The real use case: if a kernel built with [CONFIG_INTEL_IOMMU_DEFAULT_ON
> = n] running on a platform with thunderbolt ports, we must force IOMMU
> on so that the system could be protected from possible malicious
> peripherals.

Thanks for your explanation, clear now and sorry for the noise.

Regards
Zhenzhong
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
