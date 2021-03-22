Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 869FC344DC4
	for <lists.iommu@lfdr.de>; Mon, 22 Mar 2021 18:53:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11D2D606B3;
	Mon, 22 Mar 2021 17:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16zq4m88nEGw; Mon, 22 Mar 2021 17:53:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1754F60591;
	Mon, 22 Mar 2021 17:53:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E007CC0012;
	Mon, 22 Mar 2021 17:53:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA77DC0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F7324017B
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xqlr_t-FYE6v for <iommu@lists.linux-foundation.org>;
 Mon, 22 Mar 2021 17:53:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF28C40143
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 17:53:41 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so16801269otn.10
 for <iommu@lists.linux-foundation.org>; Mon, 22 Mar 2021 10:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c3qfNW7pReBN9uBBNYPS1RAciUjVnYBp+hSQCW1pI1Q=;
 b=Lxa+rLTcucBEpGfAPeWBuJDwXfZqE7TDWVw4jUPu2KFKWFft0FZpUG/G+pF+Yf+yyy
 +/TUa5IgcC3zCyGXXpuTYomkYtOYCM2eOr7OQCJ3Q6NP1JMrBajfHsa7s8XgdCpDENKK
 Rz60juy/XNiLqx4Zy1EBi+kh8lnokFWNGcv2w4JOmTrPPxhKpMW6/griviLoKAwlSYj4
 F/js7fGxYUrpfNt/QkGZ3912Uhcuoacj+YF3v//ueJSvfz71UVlmfm5hquUYp8AiQIDp
 onajRySfcOZl07bcs2GTLDnUBvEo4Icdd1QJzoAiE68CsO4vAskskcHiFdmFpBhaAyLo
 evZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=c3qfNW7pReBN9uBBNYPS1RAciUjVnYBp+hSQCW1pI1Q=;
 b=h1fgl6w6g5ks4BdZB75w+O2u+HishVPboudRgGysYIqskrKzJb7+Ac1SvsRug5BbSV
 uTLWJDs1Xdu72YplO0TomzVjYulMu0b/fca+h/LsYyrmYlVCin/b8FkPC6ffkY//GWLN
 9DymJArZhOB19uKbAkRiEzFzLHbMTY1XBl0nF44qaKM2zb+qy0w+w70BdCv5Uyy998QJ
 vVtM2TwemLRpCkQcGJlUXl8PrsD6qdGk3gpsP4yR3PX06Fm8zYd/bOR0zVgdc6mI6F5w
 oJDr1abuAJ+AMH/Jo70SSL7XhXjwjDREYxAgHAu09/D5TWDOBcgYvKE1D5E/aXVColcR
 NPQg==
X-Gm-Message-State: AOAM531A2qc4G9v9Ynr7fKSsDKbS8I6DWJXzQBQyI8WeWMGnSMbWJHLh
 aNRf0l98v2YSYOqP9a2JeDE=
X-Google-Smtp-Source: ABdhPJzWGRJWgsj2bonwStCoRaX4vDQ62Bt7L4AIICdVvrsusLy0YrT6gK8SKLwubEmAVUhRnK0tQA==
X-Received: by 2002:a9d:628d:: with SMTP id x13mr844535otk.19.1616435620934;
 Mon, 22 Mar 2021 10:53:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id u23sm3136949oof.17.2021.03.22.10.53.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Mar 2021 10:53:40 -0700 (PDT)
Date: Mon, 22 Mar 2021 10:53:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Subject: Re: [PATCH v2 1/4] iommu/vt-d: Enable write protect for supervisor SVM
Message-ID: <20210322175338.GA24424@roeck-us.net>
References: <1614680040-1989-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614680040-1989-2-git-send-email-jacob.jun.pan@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614680040-1989-2-git-send-email-jacob.jun.pan@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Sanjay Kumar <sanjay.k.kumar@intel.com>, LKML <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Tue, Mar 02, 2021 at 02:13:57AM -0800, Jacob Pan wrote:
> Write protect bit, when set, inhibits supervisor writes to the read-only
> pages. In supervisor shared virtual addressing (SVA), where page tables
> are shared between CPU and DMA, IOMMU PASID entry WPE bit should match
> CR0.WP bit in the CPU.
> This patch sets WPE bit for supervisor PASIDs if CR0.WP is set.
> 
> Signed-off-by: Sanjay Kumar <sanjay.k.kumar@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---

ia64:defconfig:

drivers/iommu/intel/pasid.c: In function 'pasid_enable_wpe':
drivers/iommu/intel/pasid.c:536:22: error: implicit declaration of function 'read_cr0'
drivers/iommu/intel/pasid.c:539:23: error: 'X86_CR0_WP' undeclared

Maybe it _is_ time to retire ia64 ?

Guenter
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
