Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CB40529F23C
	for <lists.iommu@lfdr.de>; Thu, 29 Oct 2020 17:52:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 89B2187390;
	Thu, 29 Oct 2020 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OCnvF65QWYx2; Thu, 29 Oct 2020 16:52:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0C6D887349;
	Thu, 29 Oct 2020 16:52:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE940C0051;
	Thu, 29 Oct 2020 16:52:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 173AEC0051
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 16:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 12E2F8733E
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 16:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xNfcB6plJ0B for <iommu@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 16:52:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7C1938733D
 for <iommu@lists.linux-foundation.org>; Thu, 29 Oct 2020 16:52:26 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603990343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=BwThNbQsIy31JmqgarQ4wUhEb+UzdV725F922IlA/F4=;
 b=2FkT5gzjoyr+ccyJHCtb4QbofbUucrdb26XfUpdE+rdknukTxAg72GjxOZ5n41jAnKkYB/
 nOpJkfACWzeDMF9Gf28Vi+9nUZMt6JCdJF214EEVoZ1yZcMxqCTQCc46rL/vBXNOjbaYLf
 f+eXkQpHbUsq3GQII9gW2a6gC/yzaVGRhIDCe7QC8qE2NXhN+gqydOhJhoyJkPdfEZ6A3H
 521AeFSdgq1ad66a8zBLLVOR40MhLsMZO/mD5DBZk0Zoq9X1/sGoa8LUpdsu3PsEqtSaUm
 fd5d4g1zK5WhugYvwd0KaIDhMulezjPfh4Q5hU2OhBCUeaAlgqLTDOppSiEmsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603990343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=BwThNbQsIy31JmqgarQ4wUhEb+UzdV725F922IlA/F4=;
 b=PgpLqCB/8RWNfhP0PSdbieEqqU4kgNwBJgx4lowNSAaj/HnR/wMahgJJLuQXXytVePuRe9
 Nfyl8b5dIoAH1xCQ==
To: Arnd Bergmann <arnd@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
In-Reply-To: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
Date: Thu, 29 Oct 2020 17:52:22 +0100
Message-ID: <871rhhotyx.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
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

Arnd,

On Thu, Oct 29 2020 at 10:51, Arnd Bergmann wrote:
> On Thu, Oct 29, 2020 at 8:04 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 28/10/20 22:20, Arnd Bergmann wrote:
>> > Avoid this by renaming the global 'apic' variable to the more descriptive
>> > 'x86_system_apic'. It was originally called 'genapic', but both that
>> > and the current 'apic' seem to be a little overly generic for a global
>> > variable.
>>
>> The 'apic' affects only the current CPU, so one of 'x86_local_apic',
>> 'x86_lapic' or 'x86_apic' is probably preferrable.
>
> Ok, I'll change it to x86_local_apic then, unless someone else has
> a preference between them.

x86_local_apic is fine with me.

> I think ideally there would be no global variable, withall accesses
> encapsulated in function calls, possibly using static_call() optimizations
> if any of them are performance critical.

There are a bunch, yes.

> It doesn't seem hard to do, but I'd rather leave that change to
> an x86 person ;-)

It's not hard, but I'm not really sure whether it buys much.

Can you please redo that against tip x86/apic. Much of what you are
touching got a major overhaul.

Thanks,

        tglx
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
