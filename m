Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D198E195D44
	for <lists.iommu@lfdr.de>; Fri, 27 Mar 2020 19:04:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D1F9B88337;
	Fri, 27 Mar 2020 18:04:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RFGdAzCjCXcw; Fri, 27 Mar 2020 18:04:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 809628840E;
	Fri, 27 Mar 2020 18:04:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 674C4C0177;
	Fri, 27 Mar 2020 18:04:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C2261C0177
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A90DC265AD
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:04:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id auwAkeHbV4vC for <iommu@lists.linux-foundation.org>;
 Fri, 27 Mar 2020 18:04:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 5A4A5264B4
 for <iommu@lists.linux-foundation.org>; Fri, 27 Mar 2020 18:04:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1F2730E;
 Fri, 27 Mar 2020 11:04:23 -0700 (PDT)
Received: from [10.57.60.204] (unknown [10.57.60.204])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D425B3F71E;
 Fri, 27 Mar 2020 11:04:22 -0700 (PDT)
Subject: Re: [PATCH] iommu: Lower severity of add/remove device messages
To: Ezequiel Garcia <ezequiel@collabora.com>, Joerg Roedel <joro@8bytes.org>
References: <20200323214956.30165-1-ezequiel@collabora.com>
 <20200327095029.GB11538@8bytes.org>
 <9e863f96cd9a188db84ae8bc5a0d49287b4b4922.camel@collabora.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <6db3bcfb-c778-7190-a936-836eaba4bb73@arm.com>
Date: Fri, 27 Mar 2020 18:04:22 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9e863f96cd9a188db84ae8bc5a0d49287b4b4922.camel@collabora.com>
Content-Language: en-GB
Cc: iommu@lists.linux-foundation.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
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

On 2020-03-27 1:02 pm, Ezequiel Garcia wrote:
> Hello Joerg,
> 
> Thanks for reviewing.
> 
> I understand this change bears some controversy
> for IOMMU, as developers are probably used to see these
> messages.
> 
> On Fri, 2020-03-27 at 10:50 +0100, Joerg Roedel wrote:
>> On Mon, Mar 23, 2020 at 06:49:56PM -0300, Ezequiel Garcia wrote:
>>> These user messages are not really informational,
>>> but mostly of debug nature. Lower their severity.
>>
>> Like most other messages in the kernel log, that is not a reason to
>> lower the severity.
>>
>> These messages are the first thing to look at when
>> looking into IOMMU related issues.
>>
> 
> Sure, but the messages are still here, you can
> always enable them when you are looking at IOMMU issues :-)

That still begs the question of who "you" is and how they know they're 
debugging an IOMMU issue in the first place. When all the developer has 
to go on is a third-hand bugzilla attachment from a distro user's vague 
report of graphics corruption/poor I/O performance/boot 
failure/whatever, being able to tell straight away from a standard dmesg 
dump whether an IOMMU is even in the picture or not saves a lot of 
protracted back-and-forth for everyone involved.
> The idea is to reduce the amount of verbosity in the kernel.

Under what justification? Users with slow consoles or who just want a 
quiet boot are already free to turn down the loglevel; a handful of 
messages at boot-time and device hotplug seem hardly at risk of drowning 
out all the systemd audit spam anyway. Note that the IOMMU subsystem is 
by nature a little atypical as a lot of what it does is only visible as 
secondary effects on other drivers and subsystems, without their 
explicit involvement or knowledge. In that respect, hiding its activity 
can arguably lead to more non-obvious situations than many other subsystems.

> If all subsystems would print messages that are useful
> when looking at issues, things would be quite nasty verbose.

 From a personal standpoint, can we at least eradicate all the "Hi! I'm 
a driver/subsystem you don't even have the hardware for!" messages 
first, then maybe come back and reconsider the ones that convey actual 
information later?

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
