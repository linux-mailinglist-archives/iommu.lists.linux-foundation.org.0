Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E522C30EC71
	for <lists.iommu@lfdr.de>; Thu,  4 Feb 2021 07:25:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A3DA986BC2;
	Thu,  4 Feb 2021 06:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRhnkHxbeb6K; Thu,  4 Feb 2021 06:25:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2D0A286AB8;
	Thu,  4 Feb 2021 06:25:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C6D2C013A;
	Thu,  4 Feb 2021 06:25:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B4A8C013A
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 06:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 81614871A7
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 06:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bv2wxLlCuFkA for <iommu@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 06:25:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from iam.tj (yes.iam.tj [109.74.197.121])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 54D8F87160
 for <iommu@lists.linux-foundation.org>; Thu,  4 Feb 2021 06:25:06 +0000 (UTC)
Received: from [IPv6:2a02:8010:4007::e86f:38d4:3289] (unknown
 [IPv6:2a02:8010:4007::e86f:38d4:3289])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by iam.tj (Postfix) with ESMTPSA id 42FEB340F6;
 Thu,  4 Feb 2021 06:25:02 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
 t=1612419903; bh=Ideho0Tp3kyv1rSSxj8UR7F7fb784u7p1wFjXhHxCj4=;
 h=Subject:To:References:From:Cc:Date:In-Reply-To:From;
 b=BwcPZn1W1tlTMn+T03g4COI5qUuV69O5lme/NViU6rX1ymfTn+leiXi1c3OqgGYEN
 RZxtTZuScsBKWQUc42uDWa/4XwfJIQWv19eNvrGgojGfuleOAUSyzw6kX4BJy7BpR4
 nkZ6h6+DWYFdQ1+Csdr84kizMHLYXPHZ8uz3Q96Sq/PyR+JKVBj3J5DKj/V8BxPBin
 IbJ3KFUb4KdyuboQo/qqPZ8AjBBboBVdaGv6QKNFk6QeCMk/8ASa9B1NBX38oDOJKT
 tiWbjH1YeCzJM7VV9TKndEN5FWCzpAqNK0fzvb19WqKAJTvtmvGVDkZ1jLTFQnvyu4
 O/hPImhRLRBOQ==
Subject: Re: AMD-Vi: Unable to read/write to IOMMU perf counter
To: iommu@lists.linux-foundation.org
References: <b44a9f38-adc2-f1f2-d544-c907920a7452@elloe.vision>
 <9ebcadaa-301d-2b59-04ae-be9a243c7ac0@amd.com>
From: "Tj (Elloe Linux)" <ml.linux@elloe.vision>
Organization: Elloe CIC
Message-ID: <00a54bdc-6495-d43f-744c-0df269e5d3d6@elloe.vision>
Date: Thu, 4 Feb 2021 06:25:02 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <9ebcadaa-301d-2b59-04ae-be9a243c7ac0@amd.com>
Content-Language: en-GB
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

On 02/02/2021 05:54, Suravee Suthikulpanit wrote:
> Could you please try the attached patch to see if the problem still
> persist.

Tested on top of commit 61556703b610 doesn't appear to have solved the
issue.



Linux version 5.11.0-rc6+ (tj@elloe000) (gcc (Ubuntu
9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubunt>
Command line: BOOT_IMAGE=/vmlinuz-5.11.0-rc6+
root=/dev/mapper/ELLOE000-rootfs ro acpi_osi=! "acpi_osi=Windows 20>
...
DMI: LENOVO 20NECTO1WW/20NECTO1WW, BIOS R11ET32W (1.12 ) 12/23/2019
...
AMD-Vi: ivrs, add hid:PNPD0040, uid:, rdevid:152
...
smpboot: CPU0: AMD Ryzen 7 3700U with Radeon Vega Mobile Gfx (family:
0x17, model: 0x18, stepping: 0x1)
...
pci 0000:00:00.2: AMD-Vi: Unable to read/write to IOMMU perf counter.
pci 0000:00:00.2: can't derive routing for PCI INT A
pci 0000:00:00.2: PCI INT A: not connected
pci 0000:00:01.0: Adding to iommu group 0
pci 0000:00:01.1: Adding to iommu group 1
...
pci 0000:00:00.2: AMD-Vi: Found IOMMU cap 0x40
pci 0000:00:00.2: AMD-Vi: Extended features (0x4f77ef22294ada):
PPR NX GT IA GA PC GA_vAPIC
AMD-Vi: Interrupt remapping enabled
AMD-Vi: Virtual APIC enabled
AMD-Vi: Lazy IO/TLB flushing enabled
amd_uncore: 4  amd_df counters detected
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
