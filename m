Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6994C211F00
	for <lists.iommu@lfdr.de>; Thu,  2 Jul 2020 10:40:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 105B2891AB;
	Thu,  2 Jul 2020 08:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmgghpQpzXIB; Thu,  2 Jul 2020 08:40:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 81D6789192;
	Thu,  2 Jul 2020 08:40:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65290C0733;
	Thu,  2 Jul 2020 08:40:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D9A8C0733
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 08:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0BFBD89192
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 08:40:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hVwIddbQgQqT for <iommu@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7B08D89186
 for <iommu@lists.linux-foundation.org>; Thu,  2 Jul 2020 08:40:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a6so27160944wrm.4
 for <iommu@lists.linux-foundation.org>; Thu, 02 Jul 2020 01:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=HhIqs5H8Sh0TaWImCuxyQpDb5LLrmm9oiZJu/eGa88o=;
 b=m56LE2FG27ERLTM2smVWanH1WZ8c73ZhZa5Y9WBqjYA589STp1NxLY3bSiuZcYJdce
 p13dHQLyBEc1lKOLaggE/p6JUePhv6F1vpP6HuE4B3Azop6v48geGQNPkpQhbPH+DN8b
 mYDTrq2blgYS0a+WND88IYOwlQL88RThbBIDELMtIZE6Z7aAhXrixXNDQDHt10rBg3fZ
 +StHgRD4UTa5wxbKvJQLD8nSbRd+4QzJnkY6CK/NFyh+aPfnEAcqpoUtsqd2k4QpKq2U
 +B00RnspeXUSrnf60AtCaVn0B+mtoLkeicqPxJD+S5jmzX8MnjeusWdvvviS46oZ91yA
 +WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=HhIqs5H8Sh0TaWImCuxyQpDb5LLrmm9oiZJu/eGa88o=;
 b=MKI7W8O2F1648/DYB8NlF9146D70n0mCnN+F/DbBceQeIVCdJHif9EmyKps3GXfynb
 3rSClO7gnwBOkRFUEaQg1e2hMx3Rpgy40x2XrXnSol5zEiK6ttH0tw80bMZv2tPlfWcM
 LatIQnCJGRj3iTwzvzo8iHY72q0Gigmc4CqolpMMuX+kY+spJZQfd05o5eD8gFJ9u8R0
 hXsZH1Bt6nSQ4/MdXkDncOVbRBNTdb/knC3qRmWRE0I6Zwdt9kM6v7SD2IDjRcRIe/rL
 cuxijJErvwhSn7Q6hlO68V2fUctg1gLWNevqX6MvnB8GN1E00QeTCRihtX6ZR52FtNfj
 GW9w==
X-Gm-Message-State: AOAM5332FpAlairjSxTkYyg/A6UNBqKWjEjjo2IJeifDATcbRy9Tfl1T
 2NjmaF1m1KDCisyjS8Mvg3Q=
X-Google-Smtp-Source: ABdhPJyK04Wf4jA1ICMU9g7GrNZXa1md7e+mjUuEotvKGvOj4HUmNMMgeRa0p26antgUXLdwhu512w==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr33510136wru.158.1593679224808; 
 Thu, 02 Jul 2020 01:40:24 -0700 (PDT)
Received: from localhost.localdomain ([220.240.234.21])
 by smtp.googlemail.com with ESMTPSA id m16sm5073053wro.0.2020.07.02.01.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 01:40:24 -0700 (PDT)
Message-ID: <24f56c0ed6d10ef565cf83d47d0538d37ac0d8ef.camel@gmail.com>
Subject: Re: [PATCH v2 5/7] driver core: Add device location to "struct
 device" and expose it in sysfs
From: Oliver O'Halloran <oohall@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 02 Jul 2020 18:40:09 +1000
In-Reply-To: <20200702073226.GB1073011@kroah.com>
References: <20200630044943.3425049-1-rajatja@google.com>
 <20200630044943.3425049-6-rajatja@google.com>
 <20200630104948.GC856968@kuha.fi.intel.com>
 <20200630125216.GA1109228@kroah.com>
 <CAJZ5v0iYFKrouQx_b7afPnz7ohjWOKKDhdHj_3HObKYV_rRhiw@mail.gmail.com>
 <20200630153816.GD1785141@kroah.com>
 <CAJZ5v0jUx-RVhJRDngkOXx-3szFJDOgCJs2yuGKFyo2f1qZAwA@mail.gmail.com>
 <20200630170012.GB1894898@kroah.com>
 <CACK8Z6Fcrb8PtmbUJLn8RgiGnC8eqTC9GjsgjPmQgU212WPU0Q@mail.gmail.com>
 <CAOSf1CEZ82iXhYnig0UScS+oRRaxHzSCge9LbA1hW3NaQAiSxQ@mail.gmail.com>
 <20200702073226.GB1073011@kroah.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 "Krishnakumar, Lalithambika" <lalithambika.krishnakumar@intel.com>,
 Todd Broch <tbroch@google.com>, Diego Rivas <diegorivas@google.com>,
 Rajat Jain <rajatja@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 Saravana Kannan <saravanak@google.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open
 list:AMD IOMMU \(AMD-VI\)" <iommu@lists.linux-foundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Benson Leung <bleung@google.com>,
 David Woodhouse <dwmw2@infradead.org>, Alex Levin <levinale@google.com>
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

On Thu, 2020-07-02 at 09:32 +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 02, 2020 at 03:23:23PM +1000, Oliver O'Halloran wrote:
> > Yep, that's a problem. If we want to provide a useful mechanism to
> > userspace then the default behaviour of the kernel can't undermine
> > that mechanism. If that means we need another kernel command line
> > parameter then I guess we just have to live with it.
> 
> I really do not want yet-another-kernel-command-line-option if we can
> help it at all.  Sane defaults are the best thing to do here.  Userspace
> comes up really early, put your policy in there, not in blobs passed
> from your bootloader.

Userspace comes up early, but builtin drivers will bind before init is
started. e.g.

# dmesg | egrep '0002:01:00.0|/init'
[    0.976800][    T1] pci 0002:01:00.0: [8086:1589] type 00 class 0x020000
[    0.976923][    T1] pci 0002:01:00.0: reg 0x10: [mem 0x220000000000-0x2200007fffff 64bit pref]
[    0.977004][    T1] pci 0002:01:00.0: reg 0x1c: [mem 0x220002000000-0x220002007fff 64bit pref]
[    0.977068][    T1] pci 0002:01:00.0: reg 0x30: [mem 0x00000000-0x0007ffff pref]
[    0.977122][    T1] pci 0002:01:00.0: BAR3 [mem size 0x00008000 64bit pref]: requesting alignment to 0x10000
[    0.977401][    T1] pci 0002:01:00.0: PME# supported from D0 D3hot
[    1.011929][    T1] pci 0002:01:00.0: BAR 0: assigned [mem 0x220000000000-0x2200007fffff 64bit pref]
[    1.012085][    T1] pci 0002:01:00.0: BAR 6: assigned [mem 0x3fe100000000-0x3fe10007ffff pref]
[    1.012127][    T1] pci 0002:01:00.0: BAR 3: assigned [mem 0x220002000000-0x220002007fff 64bit pref]
[    4.399588][   T12] i40e 0002:01:00.0: enabling device (0140 -> 0142)
[    4.410891][   T12] i40e 0002:01:00.0: fw 5.1.40981 api 1.5 nvm 5.03 0x80002469 1.1313.0 [8086:1589] [15d9:0000]
[    4.647524][   T12] i40e 0002:01:00.0: MAC address: 0c:c4:7a:b7:fc:74
[    4.647685][   T12] i40e 0002:01:00.0: FW LLDP is enabled
[    4.653918][   T12] i40e 0002:01:00.0 eth0: NIC Link is Up, 1000 Mbps Full Duplex, Flow Control: None
[    4.655552][   T12] i40e 0002:01:00.0: PCI-Express: Speed 8.0GT/s Width x8
[    4.656071][   T12] i40e 0002:01:00.0: Features: PF-id[0] VSIs: 34 QP: 80 RSS FD_ATR FD_SB NTUPLE VxLAN Geneve PTP VEPA
[   13.803709][    T1] Run /init as init process
[   13.963242][  T711] i40e 0002:01:00.0 enP2p1s0f0: renamed from eth0

Building everything into the kernel is admittedly pretty niche. I only
do it to avoid re-building the initramfs for my test kernels. It does
seem relatively common on embedded systems, but I'm not sure how many
of those care about PCIe. It would be nice to provide *something* to
cover that case for the people who care.

Oliver


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
