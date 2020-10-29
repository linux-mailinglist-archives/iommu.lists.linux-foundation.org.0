Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 114FE29F659
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 21:41:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 96466875BE;
	Thu, 29 Oct 2020 20:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aNbyAioa5Qkj; Thu, 29 Oct 2020 20:41:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2CD14875BD;
	Thu, 29 Oct 2020 20:41:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14013C0051;
	Thu, 29 Oct 2020 20:41:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8FCECC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 20:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 72A7520011
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 20:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o1qfLxADU-gM for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 20:41:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B99F1FEED
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 20:41:17 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1604004074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atBWSsg54EdElpQmxIGprMythfayvCfZuL6C0LobpJM=;
 b=zq8OmPxEES1sHwpepW8vzEe0jYTTlYtXV12+hxY9jzb3tYWHhm/ZdTBMeg3suW0uXnI22o
 QRfyl9qohhkGLsu5YphvfKNBGVVDQawQCEUKIkYyS9kHIx+egw2JhKwPfjRd0CQcLbf0Ma
 0+PC2RmqmSccZCm0+EePmF3HtanM8DIlixTveKLP2V0Ksru8Qhe9ajxfSPkPPl0uWvBwkU
 CZwbIAvCZIttVS0GI97ynyZTPYQQIOv8hYusYoSjZ4dO50yoSQ3YCiIbnrq6RPIo7I7h9P
 itJ4XgJrsTvo9TskPmCZoEXzffgEzSJ6VbIxGy8NcIttwKKxU5XG9VypabrK6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1604004074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=atBWSsg54EdElpQmxIGprMythfayvCfZuL6C0LobpJM=;
 b=0iX007DAMCgsp9VjWAMG/D89r7Kujao6BFenyKLGjjTNx6nxedksxtcAkjsrsCDNJr2Ram
 K5nPYTQvIUbyR9CA==
To: Paolo Bonzini <pbonzini@redhat.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
In-Reply-To: <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
 <20201029165611.GA2557691@rani.riverdale.lan>
 <93180c2d-268c-3c33-7c54-4221dfe0d7ad@redhat.com>
Date: Thu, 29 Oct 2020 21:41:13 +0100
Message-ID: <87v9esojdi.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Cc: 'Arnd Bergmann' <arnd@kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, "x86@kernel.org" <x86@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Wanpeng Li <wanpengli@tencent.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Jim Mattson <jmattson@google.com>
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

On Thu, Oct 29 2020 at 17:59, Paolo Bonzini wrote:
> On 29/10/20 17:56, Arvind Sankar wrote:
>>> For those two just add:
>>> 	struct apic *apic = x86_system_apic;
>>> before all the assignments.
>>> Less churn and much better code.
>>>
>> Why would it be better code?
>> 
>
> I think he means the compiler produces better code, because it won't
> read the global variable repeatedly.  Not sure if that's true,(*) but I
> think I do prefer that version if Arnd wants to do that tweak.

It's not true.

     foo *p = bar;

     p->a = 1;
     p->b = 2;

The compiler is free to reload bar after accessing p->a and with

    bar->a = 1;
    bar->b = 1;

it can either cache bar in a register or reread it after bar->a

The generated code is the same as long as there is no reason to reload,
e.g. register pressure.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
