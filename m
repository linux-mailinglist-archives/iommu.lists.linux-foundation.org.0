Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAD1FED48
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 10:13:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DB2B9869EC;
	Thu, 18 Jun 2020 08:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9IM86oKqrCCE; Thu, 18 Jun 2020 08:13:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D3D086374;
	Thu, 18 Jun 2020 08:13:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 549F9C016E;
	Thu, 18 Jun 2020 08:13:14 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0542C016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 08:13:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C543B87EB4
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 08:13:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3OHqcYWVfuH for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 08:13:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B32587B61
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 08:13:09 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id e9so2564033pgo.9
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 01:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ene5uMUm+upAXA9BJzuffmYO6Vv0lNnhNcaEqAS2hRI=;
 b=oMlIb0FoGBOJsgrNjpyA6usrw+ThWjyOMCmvPw99IwyYIB9ip/U9QzQHM7FRRCUyVa
 k34zw3yY6VYyswqz9FW7UYIj/4DmuvGwkZ6M2Sty2biD7jPkTJa1jEwgALUm1GfCim3D
 XKrA7g31mdNnR/gZy1pgwqzhrqnfzJ41FhSygGWHtmdBqIp5FvDh+5lrCQhdsYgSozBR
 4P63nnZI4qWxo2ZZh1o3UxJluffSonG0U0VdlUfB6sgRVIWElBaQjWnyc8szcFsPdHk/
 cLslW6W/v55tZ6UkbptbmR4NGzT9n6kIjKALMasirBmP2nutJjYj7WeTdQlj/mW9chfC
 yKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ene5uMUm+upAXA9BJzuffmYO6Vv0lNnhNcaEqAS2hRI=;
 b=LYha51a41EbOVP+vwl1CL9Q+1KVslCUHfQAuN14eEWDQlzvaWXMGe7qkxzkxWRb20G
 HH5l7EOGcybvZvciRywdjAavMCroznchha+aa0c8dFHHVMDz3jMDRX6c+05AQiVsvbvK
 9PeQemdChbCQdfXdsGfKH939KZSXxb1jSFWqi13VJFSWSRr8wrlZ8ytNhCsBmna4l9+z
 Gj3SFEE8szaxoEY2wmlmrR6EPAceSaOCsqI15lIFqiFSeQ75v1YDewy7B4O2H9AItckW
 q0/Gt9vd5dG8NU3qwJzjKuLdiScYt8BAipv+CEtbEv64YPnKlwAtFF3qkw2x+tMN7dQf
 tgLg==
X-Gm-Message-State: AOAM533L6r8WUbVSLfvqnAvSF9BELEhrzL3KaZ3xymHkFmx59TTYd2lQ
 ekdxgxSwi0/lyvfksw9s6HEFXVmxL4nLxNfp2lY=
X-Google-Smtp-Source: ABdhPJzn2cN3ofWkUgWLzA5Vs/OEjLvfC75aOifXK9Wv9zVyHGJzQXPmA/pTNu8thNBvmrN+azQmzx37a2Glr4j49IE=
X-Received: by 2002:a62:1c46:: with SMTP id c67mr2533442pfc.170.1592467988587; 
 Thu, 18 Jun 2020 01:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200616011742.138975-1-rajatja@google.com>
 <20200616011742.138975-4-rajatja@google.com>
 <20200616073249.GB30385@infradead.org>
 <CACK8Z6ELaM8KxbwPor=BUquWN7pALQmmHu5geSOc71P3KoJ1QA@mail.gmail.com>
 <20200617073100.GA14424@infradead.org>
 <CACK8Z6FecYkAYQh4sm4RbAQ1iwb9gexqgY9ExD9BH2p-5Usj=g@mail.gmail.com>
In-Reply-To: <CACK8Z6FecYkAYQh4sm4RbAQ1iwb9gexqgY9ExD9BH2p-5Usj=g@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 18 Jun 2020 11:12:56 +0300
Message-ID: <CAHp75Vc6eA33cyAQH-m+yixTuHqiobg6fo7nzbbb-J6vN6qFcA@mail.gmail.com>
Subject: Re: [PATCH 4/4] pci: export untrusted attribute in sysfs
To: Rajat Jain <rajatja@google.com>
Cc: Todd Broch <tbroch@google.com>, linux-pci <linux-pci@vger.kernel.org>,
 "Krishnakumar, Lalithambika" <lalithambika.krishnakumar@intel.com>,
 Diego Rivas <diegorivas@google.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Furquan Shaikh <furquan@google.com>, Raj Ashok <ashok.raj@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Christian Kellner <christian@kellner.me>,
 Mattias Nissler <mnissler@google.com>, Jesse Barnes <jsbarnes@google.com>,
 Len Brown <lenb@kernel.org>, Rajat Jain <rajatxjain@gmail.com>,
 Prashant Malani <pmalani@google.com>, Aaron Durbin <adurbin@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Bernie Keany <bernie.keany@intel.com>, Duncan Laurie <dlaurie@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Oliver O'Halloran <oohall@gmail.com>,
 Benson Leung <bleung@google.com>, David Woodhouse <dwmw2@infradead.org>,
 Alex Levin <levinale@google.com>
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

On Wed, Jun 17, 2020 at 10:56 PM Rajat Jain <rajatja@google.com> wrote:
> On Wed, Jun 17, 2020 at 12:31 AM Christoph Hellwig <hch@infradead.org> wrote:

...

> (and likely call it "external" instead of "untrusted".

Which is not okay. 'External' to what? 'untrusted' has been carefully
chosen by the meaning of it.
What external does mean for M.2. WWAN card in my laptop? It's in ACPI
tables, but I can replace it.
This is only one example. Or if firmware of some device is altered,
and it's internal (whatever it means) is it trusted or not?

So, please leave it as is (I mean name).

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
