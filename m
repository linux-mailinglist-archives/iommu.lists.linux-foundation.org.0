Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDD31F859
	for <lists.iommu@lfdr.de>; Fri, 19 Feb 2021 12:24:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 28DC087099;
	Fri, 19 Feb 2021 11:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kqr2iihLZWf; Fri, 19 Feb 2021 11:24:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8010F870BB;
	Fri, 19 Feb 2021 11:24:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62E32C000D;
	Fri, 19 Feb 2021 11:24:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0220C000D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 11:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EB30F8746A
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 11:24:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eGWG5qUaQBOK for <iommu@lists.linux-foundation.org>;
 Fri, 19 Feb 2021 11:24:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EF6F98745D
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 11:24:40 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id o82so6772177wme.1
 for <iommu@lists.linux-foundation.org>; Fri, 19 Feb 2021 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zCVCGfpcGUg5Px5IkRhBWHBwwW9kKhwMyF5GnjfKCZE=;
 b=SNXQXS+Rk4zR9ry2tBy7uyzYzoV5n5bdj9DH6vtNTc+lm/IV7fd9oW2B4038viCsA6
 MQZATISWNexKBAzqxwbw82zWwcaeRzZ/7KxDpadje4Zc4t+O+KcqeSBD+UhSl38Nmxm6
 elOiTpx4Lz73w+nm22xBSJR1GCPirDWKMzHXNbw68vUfCv1gwhoOJ2n2wFYLWlTc9JJa
 DoFqMZOTufq0jfoAAwJQuyiWcM34srDry2oCNrdEdqZx+kb7kn1hWbXhWf6cmwJ6we1C
 0C9begTm6lMcWejRk3tgc7AOj+Cjgn1c9KcthCwysfEIWlP2+ptojf/h7aW1CSHoU+KJ
 tbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zCVCGfpcGUg5Px5IkRhBWHBwwW9kKhwMyF5GnjfKCZE=;
 b=kx/3OgV9HkP++mWUojIw+a2m1BWbNpbcHAXkwkom6uNh1qGJMuQF9pkA9dpLHD/tDh
 /77tV4KhwFWIfVgLLFel/qI5/HT1FRorMtukE5O9YTu6wSiTIcoZmBnfWhyTjTDQpsyZ
 lA4MbtdaNRBCIDxsiDYXE362HbHyvEyU6RDiw1yQlUAb3ruIubtcLaa5xg7yC0JIuD/j
 Ff+crjY+cgGis7fCXkwYoP4giz9PXRB34FgywbwZnxjFMn49Ce1rUVHdoho8DcAEB01h
 62tztAQEcprenucE14JttN0gO/dKpmEl081/h35FGovXzRO/fz/gd7ULLhm6HcIRhOU9
 4R3A==
X-Gm-Message-State: AOAM532IaoGuCyNZdVShZYbWsPh9e0j6kWdpWbpyvnyHnGDh0/nU0Dv6
 7kZViTQbrWvrp/IMiE0quXIUWA==
X-Google-Smtp-Source: ABdhPJyYAfGUPRmpeQc3wkdUgiPIGZPd/wsxuCSC2g2G9RfY3ZmxraBhZfw70Yqb9TG8ZbW1es0DMw==
X-Received: by 2002:a1c:1c9:: with SMTP id 192mr7920693wmb.150.1613733879357; 
 Fri, 19 Feb 2021 03:24:39 -0800 (PST)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id a84sm11977857wme.12.2021.02.19.03.24.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 03:24:38 -0800 (PST)
Date: Fri, 19 Feb 2021 12:24:21 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Al Stone <ahs3@redhat.com>
Subject: Re: [EXTERNAL] Re: Question regarding VIOT proposal
Message-ID: <YC+f5bTMLFYgiOvS@myrica>
References: <20201203230127.GD4343@redhat.com>
 <20201204180924.GA1922896@myrica>
 <20201204201825.GG4343@redhat.com> <YBkYsSHGUfG91NoN@myrica>
 <20210202202713.GF702808@redhat.com> <YBpjAF3Q+NeJblE9@myrica>
 <20210204202524.GO702808@redhat.com>
 <20210216213103.GT702808@redhat.com> <YCzj85YDWRxmrCHo@myrica>
 <20210218233943.GH702808@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210218233943.GH702808@redhat.com>
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Boeuf,
 Sebastien" <sebastien.boeuf@intel.com>,
 Alexander Grest <Alexander.Grest@microsoft.com>,
 Yinghan Yang <Yinghan.Yang@microsoft.com>
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

On Thu, Feb 18, 2021 at 04:39:43PM -0700, Al Stone wrote:
> As of today, the proposal has been approved for inclusion in the next
> release of the ACPI spec (whatever version gets released post the 6.4
> version that just came out).
> 
> Congratulations ?!? :)
> 
> And thanks to all for their patience during this process.  You now
> have the dubious disctinction of being the very first table added
> to the spec that _started_ as open source.

That is great news! Thanks again for your help with this :)

Just to confirm, we don't need to wait for the release of the 6.5 version
of the spec before upstreaming support for the table?

Another question that might come up at some point, is how to add new
subtables. Is the process documented somewhere?

For the moment I sent a -poorly numbered- pull request for acpica:
https://github.com/acpica/acpica/pull/666

Thanks,
Jean
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
