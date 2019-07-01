Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 697584369A
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 15:30:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 13FA1E59;
	Thu, 13 Jun 2019 13:30:23 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 79CDFE45
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 13:30:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B057F63D
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 13:30:18 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id u134so8328740ywf.6
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kudzu-us.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=gpC/BcbJqZm/b199OKanFtWwuFNfn3Nh4TAP7OeO2NA=;
	b=BXofh382FGQ6XKPL2MfgAofF8BQm+/tgz4ml76l/iJkrG2E/+Dn2CcsfgfbiuEU3tj
	RuZDqTsDzm6ObH1XEtafWfBUf0me0bv7ELlRK/EDgBLTTgGPCN72PLbTY5I64v8joDPd
	vxEGj4K1laNQ4h//KZVXnpwBplBXDchGCJsiGY/LoSNyOPFsqamliqkc/auc6LnvDP6z
	NdYHf9KnTMvUsC+0FFJCOuLumZOWQWWFFm7EjGvUO1RF3FRQHmeF81IER2zJvyqqJvVa
	tYxikwp4VS73sfIlUIcSULdSIFQqhVNuqn4zfVaeOca9Eh6qh4k1yBfMCKcYh7/N9fdC
	cPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=gpC/BcbJqZm/b199OKanFtWwuFNfn3Nh4TAP7OeO2NA=;
	b=kwDeQcZrlSm7r/wTnJhtVCHpfJYSjH5C5mIA0yzCE+y8WyYrfMV/3rrtGvxfv3lEui
	2vWe5QrFggU5MZRKlso6Rggv7xfkD8uozfaUEJ9cfEj3FVHMdP08ljlShb/IF2R0JfhE
	NEaxgvrZJJNVQxZbC9ZmrnphLOgFG+Xw2Ds0oSM72ntQR1g/Cw7cAZpMSuHSpJw1tVtg
	sgNwTq3KnX7ZulVtrdsv3AglwIG92mZH4twE+el8aTFvk4qh0h7lgQQGqYwBesp2jDwZ
	87qMh2B8aJgA8mdV+62RjEL58vEPCQI0W7ELD6gRoJPjFv1RX0K0m17RdvorF04oH6vp
	9nTg==
X-Gm-Message-State: APjAAAVvftXXaDz+sXv6NXnSSAqkYFzKCoqTdoKaA33PV2G81WtVXD9K
	gd2v8BRWRjHOzDzNph162Jw0kA==
X-Google-Smtp-Source: APXvYqxTssA/J+9V16+D44hORYBVXWzyfYlD4b0eRTXEkb7pd189qJsIUW5hoWZ7PNVmk1rzS/3Kzg==
X-Received: by 2002:a0d:ea10:: with SMTP id t16mr32493125ywe.221.1560432617677;
	Thu, 13 Jun 2019 06:30:17 -0700 (PDT)
Received: from kudzu.us (76-230-155-4.lightspeed.rlghnc.sbcglobal.net.
	[76.230.155.4])
	by smtp.gmail.com with ESMTPSA id p12sm742658ywg.72.2019.06.13.06.30.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 06:30:17 -0700 (PDT)
Date: Thu, 13 Jun 2019 09:30:15 -0400
From: Jon Mason <jdmason@kudzu.us>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH v5 00/10]  Support using MSI interrupts in ntb_transport
Message-ID: <20190613133014.GE1572@kudzu.us>
References: <20190523223100.5526-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190523223100.5526-1-logang@deltatee.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Allen Hubbe <allenbh@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Serge Semin <fancer.lancer@gmail.com>, Eric Pilmore <epilmore@gigaio.com>,
	iommu@lists.linux-foundation.org, linux-kselftest@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>, linux-ntb@googlegroups.com
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On Thu, May 23, 2019 at 04:30:50PM -0600, Logan Gunthorpe wrote:
> This is another resend as there has been no feedback since v4.
> Seems Jon has been MIA this past cycle so hopefully he appears on the
> list soon.
> 
> I've addressed the feedback so far and rebased on the latest kernel
> and would like this to be considered for merging this cycle.
> 
> The only outstanding issue I know of is that it still will not work
> with IDT hardware, but ntb_transport doesn't work with IDT hardware
> and there is still no sensible common infrastructure to support
> ntb_peer_mw_set_trans(). Thus, I decline to consider that complication
> in this patchset. However, I'll be happy to review work that adds this
> feature in the future.
> 
> Also, as the port number and resource index stuff is a bit complicated,
> I made a quick out of tree test fixture to ensure it's correct[1]. As
> an excerise I also wrote some test code[2] using the upcomming KUnit
> feature.

Sorry for the delay.  The patch is now in the ntb-next branch.  We've
missed window for 5.2, but it will be in the 5.3 pull request (barring
last minute comments).

Thanks,
Jon

> 
> Logan
> 
> [1] https://repl.it/repls/ExcitingPresentFile
> [2] https://github.com/sbates130272/linux-p2pmem/commits/ntb_kunit
> 
> --
> 
> Changes in v5:
> 
> * Rebased onto v5.2-rc1 (plus the patches in ntb-next)
> 
> --
> 
> Changes in v4:
> 
> * Rebased onto v5.1-rc6 (No changes)
> 
> * Numerous grammar and spelling mistakes spotted by Bjorn
> 
> --
> 
> Changes in v3:
> 
> * Rebased onto v5.1-rc1 (Dropped the first two patches as they have
>   been merged, and cleaned up some minor conflicts in the PCI tree)
> 
> * Added a new patch (#3) to calculate logical port numbers that
>   are port numbers from 0 to (number of ports - 1). This is
>   then used in ntb_peer_resource_idx() to fix the issues brought
>   up by Serge.
> 
> * Fixed missing __iomem and iowrite calls (as noticed by Serge)
> 
> * Added patch 10 which describes ntb_msi_test in the documentation
>   file (as requested by Serge)
> 
> * A couple other minor nits and documentation fixes
> 
> --
> 
> Changes in v2:
> 
> * Cleaned up the changes in intel_irq_remapping.c to make them
>   less confusing and add a comment. (Per discussion with Jacob and
>   Joerg)
> 
> * Fixed a nit from Bjorn and collected his Ack
> 
> * Added a Kconfig dependancy on CONFIG_PCI_MSI for CONFIG_NTB_MSI
>   as the Kbuild robot hit a random config that didn't build
>   without it.
> 
> * Worked in a callback for when the MSI descriptor changes so that
>   the clients can resend the new address and data values to the peer.
>   On my test system this was never necessary, but there may be
>   other platforms where this can occur. I tested this by hacking
>   in a path to rewrite the MSI descriptor when I change the cpu
>   affinity of an IRQ. There's a bit of uncertainty over the latency
>   of the change, but without hardware this can acctually occur on
>   we can't test this. This was the result of a discussion with Dave.
> 
> --
> 
> This patch series adds optional support for using MSI interrupts instead
> of NTB doorbells in ntb_transport. This is desirable seeing doorbells on
> current hardware are quite slow and therefore switching to MSI interrupts
> provides a significant performance gain. On switchtec hardware, a simple
> apples-to-apples comparison shows ntb_netdev/iperf numbers going from
> 3.88Gb/s to 14.1Gb/s when switching to MSI interrupts.
> 
> To do this, a couple changes are required outside of the NTB tree:
> 
> 1) The IOMMU must know to accept MSI requests from aliased bused numbers
> seeing NTB hardware typically sends proxied request IDs through
> additional requester IDs. The first patch in this series adds support
> for the Intel IOMMU. A quirk to add these aliases for switchtec hardware
> was already accepted. See commit ad281ecf1c7d ("PCI: Add DMA alias quirk
> for Microsemi Switchtec NTB") for a description of NTB proxy IDs and why
> this is necessary.
> 
> 2) NTB transport (and other clients) may often need more MSI interrupts
> than the NTB hardware actually advertises support for. However, seeing
> these interrupts will not be triggered by the hardware but through an
> NTB memory window, the hardware does not actually need support or need
> to know about them. Therefore we add the concept of Virtual MSI
> interrupts which are allocated just like any other MSI interrupt but
> are not programmed into the hardware's MSI table. This is done in
> Patch 2 and then made use of in Patch 3.
> 
> The remaining patches in this series add a library for dealing with MSI
> interrupts, a test client and finally support in ntb_transport.
> 
> The series is based off of v5.1-rc6 plus the patches in ntb-next.
> A git repo is available here:
> 
> https://github.com/sbates130272/linux-p2pmem/ ntb_transport_msi_v4
> 
> Thanks,
> 
> Logan
> 
> --
> 
> Logan Gunthorpe (10):
>   PCI/MSI: Support allocating virtual MSI interrupts
>   PCI/switchtec: Add module parameter to request more interrupts
>   NTB: Introduce helper functions to calculate logical port number
>   NTB: Introduce functions to calculate multi-port resource index
>   NTB: Rename ntb.c to support multiple source files in the module
>   NTB: Introduce MSI library
>   NTB: Introduce NTB MSI Test Client
>   NTB: Add ntb_msi_test support to ntb_test
>   NTB: Add MSI interrupt support to ntb_transport
>   NTB: Describe the ntb_msi_test client in the documentation.
> 
>  Documentation/ntb.txt                   |  27 ++
>  drivers/ntb/Kconfig                     |  11 +
>  drivers/ntb/Makefile                    |   3 +
>  drivers/ntb/{ntb.c => core.c}           |   0
>  drivers/ntb/msi.c                       | 415 +++++++++++++++++++++++
>  drivers/ntb/ntb_transport.c             | 169 ++++++++-
>  drivers/ntb/test/Kconfig                |   9 +
>  drivers/ntb/test/Makefile               |   1 +
>  drivers/ntb/test/ntb_msi_test.c         | 433 ++++++++++++++++++++++++
>  drivers/pci/msi.c                       |  54 ++-
>  drivers/pci/switch/switchtec.c          |  12 +-
>  include/linux/msi.h                     |   8 +
>  include/linux/ntb.h                     | 196 ++++++++++-
>  include/linux/pci.h                     |   9 +
>  tools/testing/selftests/ntb/ntb_test.sh |  54 ++-
>  15 files changed, 1386 insertions(+), 15 deletions(-)
>  rename drivers/ntb/{ntb.c => core.c} (100%)
>  create mode 100644 drivers/ntb/msi.c
>  create mode 100644 drivers/ntb/test/ntb_msi_test.c
> 
> --
> 2.20.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
