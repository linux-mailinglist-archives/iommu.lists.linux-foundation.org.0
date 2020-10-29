Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D35229E7CC
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 10:51:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A501A8726D;
	Thu, 29 Oct 2020 09:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0jwDZ6uA-3W; Thu, 29 Oct 2020 09:51:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3B65487275;
	Thu, 29 Oct 2020 09:51:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F6ECC0051;
	Thu, 29 Oct 2020 09:51:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 43503C0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 23B1720242
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:51:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8iKImMgc3cM for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 09:51:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 1DB9C2014B
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:51:39 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E58620825
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 09:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603965098;
 bh=9kcfotFFJ47rYdLC6ZxzdCDBa1k7PeFD878Gh2iRMYw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=vMd1WTw46NmbdjDfGERZXE49CkIxTu62Lo98SE3sftOXo2ak1wjE9ZykA5QSCJ4f6
 RDyWIZLY0FUMnquHbcpT2wuFgnwMWGJcElPYN/dCVDOBDKjwtw6POjOBjpvi7Bxxzs
 IPD7rWkW0qA5Zp3lwpn5CoP9SOsl9SQ1SBIW0R2s=
Received: by mail-qv1-f49.google.com with SMTP id ev17so1085680qvb.3
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 02:51:38 -0700 (PDT)
X-Gm-Message-State: AOAM5309RqM/YrblvlprMTfWy8mxLJOM1RFGTQiuBejZkLWb29wGQg2i
 gso4EJWYH6KK3t2L86b54dnduY72dUP8/tQHsVk=
X-Google-Smtp-Source: ABdhPJxaZEntygitIVQOXS85Gb8nGw1osAMMJulsU6ZeD1uTGkc5sotJk4c97dNCIKL6ORL8v2BjlIfOh3rRL6d2/zw=
X-Received: by 2002:ad4:4203:: with SMTP id k3mr2986180qvp.8.1603965097361;
 Thu, 29 Oct 2020 02:51:37 -0700 (PDT)
MIME-Version: 1.0
References: <20201028212417.3715575-1-arnd@kernel.org>
 <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
In-Reply-To: <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 29 Oct 2020 10:51:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Message-ID: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 kvm list <kvm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Thomas Gleixner <tglx@linutronix.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Jim Mattson <jmattson@google.com>
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

On Thu, Oct 29, 2020 at 8:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 28/10/20 22:20, Arnd Bergmann wrote:
> > Avoid this by renaming the global 'apic' variable to the more descriptive
> > 'x86_system_apic'. It was originally called 'genapic', but both that
> > and the current 'apic' seem to be a little overly generic for a global
> > variable.
>
> The 'apic' affects only the current CPU, so one of 'x86_local_apic',
> 'x86_lapic' or 'x86_apic' is probably preferrable.

Ok, I'll change it to x86_local_apic then, unless someone else has
a preference between them.

> I don't have huge objections to renaming 'apic' variables and arguments
> in KVM to 'lapic'.  I do agree with Sean however that it's going to
> break again very soon.

I think ideally there would be no global variable, withall accesses
encapsulated in function calls, possibly using static_call() optimizations
if any of them are performance critical.

It doesn't seem hard to do, but I'd rather leave that change to
an x86 person ;-)

      Arnd
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
