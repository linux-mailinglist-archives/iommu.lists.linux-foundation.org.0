Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E87983BA7C7
	for <lists.iommu@lfdr.de>; Sat,  3 Jul 2021 10:31:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF496074F;
	Sat,  3 Jul 2021 08:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXwXWuIr-uHp; Sat,  3 Jul 2021 08:31:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5C29E60744;
	Sat,  3 Jul 2021 08:31:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 273EEC0022;
	Sat,  3 Jul 2021 08:31:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8C25C001A
 for <iommu@lists.linux-foundation.org>; Sat,  3 Jul 2021 08:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AE46606D9
 for <iommu@lists.linux-foundation.org>; Sat,  3 Jul 2021 08:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GYLvvrIsR-Ze for <iommu@lists.linux-foundation.org>;
 Sat,  3 Jul 2021 08:31:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A10E260C07
 for <iommu@lists.linux-foundation.org>; Sat,  3 Jul 2021 08:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625301073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A5pLvLjSYytl9fxuQeHwRO0qsjIw9mqvaKkb7Y9O3i8=;
 b=eFY+saDpB3yRNFoGN+HMUaDEsl//zqpPAP2m8INoI0g88LjWeljAwDhPKO9+2qQu9/yJQz
 Fsm2VO8hiFKUuX6ccqdanskY9dD8rzh56sgJlptp3HjhYsm735axJtu+fMP2FCGwLpsvfe
 hC+PSk5KhNz0tcILfT5du3nZqIGheVg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-JSmYrEwdN6mCCAHu43dtPA-1; Sat, 03 Jul 2021 04:31:10 -0400
X-MC-Unique: JSmYrEwdN6mCCAHu43dtPA-1
Received: by mail-wm1-f70.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so7497887wms.8
 for <iommu@lists.linux-foundation.org>; Sat, 03 Jul 2021 01:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A5pLvLjSYytl9fxuQeHwRO0qsjIw9mqvaKkb7Y9O3i8=;
 b=TymGHQKuAU+M1gEAu3bSYPcTZdeFIm4z5WkXGQyXHOC1FNpi+jC+RAuFtzQ1mUTxH1
 jLT0BkTXTFljdnciCoWKH5WEULglNatbqq64C56fQBVDsHTdaPX0PM7jMdJvrkNQz0Uk
 t55Ah5Gn0/7WPZ79n/m5jMTbpTPTu8gDNGWmv36ZGmUfwjBir4ICr25bhgtTI/WHFsAc
 /a+sxYEkX8HUEnIDKnYk0s24KVTTwy8EEvu4MKyFcgroi57hxoHYsY2sOxfGE6G+Tf9P
 92GrXEIRdv4xpo/J8ULxXt5G4tFFpYVwljVtQG54QQoTt9rX914W+NVglSxOSve7FoeK
 ZFPA==
X-Gm-Message-State: AOAM533232opD5mFQqJ+SfR9iSjJq9Oz/J9MSk/rHnyD8nj4Ermp2Ob5
 W7KTJ5NSOHHJ+6jZx60hX5905MbvzuUxYl5Z27+dOyKXTuVxJBF6qv5vrQrjmAWOwJQcEfQS3Ek
 EQnHaAsLTPnid66iTBBdaj60EuCcNGw==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr3900765wmk.17.1625301069177; 
 Sat, 03 Jul 2021 01:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrvv4LtZcQ7zdL29oxvTkKz5qNfM0qWp0wXMltlMPDTMTgPHfjYLGKI6BE2STBxqHT1590MA==
X-Received: by 2002:a05:600c:296:: with SMTP id
 22mr3900747wmk.17.1625301069032; 
 Sat, 03 Jul 2021 01:31:09 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id k5sm5943632wmk.11.2021.07.03.01.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jul 2021 01:31:08 -0700 (PDT)
Date: Sat, 3 Jul 2021 04:31:03 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: He Zhe <zhe.he@windriver.com>
Subject: Re: [PATCH] eventfd: Enlarge recursion limit to allow vhost to work
Message-ID: <20210703043039-mutt-send-email-mst@kernel.org>
References: <CACycT3t1Dgrzsr7LbBrDhRLDa3qZ85ZOgj9H7r1fqPi-kf7r6Q@mail.gmail.com>
 <20210618084412.18257-1-zhe.he@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20210618084412.18257-1-zhe.he@windriver.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, jasowang@redhat.com,
 virtualization@lists.linux-foundation.org, christian.brauner@canonical.com,
 qiang.zhang@windriver.com, corbet@lwn.net, willy@infradead.org,
 hch@infradead.org, xieyongji@bytedance.com, dan.carpenter@oracle.com,
 sgarzare@redhat.com, viro@zeniv.linux.org.uk, stefanha@redhat.com,
 songmuchun@bytedance.com, axboe@kernel.dk, gregkh@linuxfoundation.org,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, bcrl@kvack.org,
 linux-fsdevel@vger.kernel.org, mika.penttila@nextfour.com
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

On Fri, Jun 18, 2021 at 04:44:12PM +0800, He Zhe wrote:
> commit b5e683d5cab8 ("eventfd: track eventfd_signal() recursion depth")
> introduces a percpu counter that tracks the percpu recursion depth and
> warn if it greater than zero, to avoid potential deadlock and stack
> overflow.
> 
> However sometimes different eventfds may be used in parallel. Specifically,
> when heavy network load goes through kvm and vhost, working as below, it
> would trigger the following call trace.
> 
> -  100.00%
>    - 66.51%
>         ret_from_fork
>         kthread
>       - vhost_worker
>          - 33.47% handle_tx_kick
>               handle_tx
>               handle_tx_copy
>               vhost_tx_batch.isra.0
>               vhost_add_used_and_signal_n
>               eventfd_signal
>          - 33.05% handle_rx_net
>               handle_rx
>               vhost_add_used_and_signal_n
>               eventfd_signal
>    - 33.49%
>         ioctl
>         entry_SYSCALL_64_after_hwframe
>         do_syscall_64
>         __x64_sys_ioctl
>         ksys_ioctl
>         do_vfs_ioctl
>         kvm_vcpu_ioctl
>         kvm_arch_vcpu_ioctl_run
>         vmx_handle_exit
>         handle_ept_misconfig
>         kvm_io_bus_write
>         __kvm_io_bus_write
>         eventfd_signal
> 
> 001: WARNING: CPU: 1 PID: 1503 at fs/eventfd.c:73 eventfd_signal+0x85/0xa0
> ---- snip ----
> 001: Call Trace:
> 001:  vhost_signal+0x15e/0x1b0 [vhost]
> 001:  vhost_add_used_and_signal_n+0x2b/0x40 [vhost]
> 001:  handle_rx+0xb9/0x900 [vhost_net]
> 001:  handle_rx_net+0x15/0x20 [vhost_net]
> 001:  vhost_worker+0xbe/0x120 [vhost]
> 001:  kthread+0x106/0x140
> 001:  ? log_used.part.0+0x20/0x20 [vhost]
> 001:  ? kthread_park+0x90/0x90
> 001:  ret_from_fork+0x35/0x40
> 001: ---[ end trace 0000000000000003 ]---
> 
> This patch enlarges the limit to 1 which is the maximum recursion depth we
> have found so far.
> 
> The credit of modification for eventfd_signal_count goes to
> Xie Yongji <xieyongji@bytedance.com>
> 

And maybe:

Fixes: b5e683d5cab8 ("eventfd: track eventfd_signal() recursion depth")

who's merging this?

> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  fs/eventfd.c            | 3 ++-
>  include/linux/eventfd.h | 5 ++++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/eventfd.c b/fs/eventfd.c
> index e265b6dd4f34..add6af91cacf 100644
> --- a/fs/eventfd.c
> +++ b/fs/eventfd.c
> @@ -71,7 +71,8 @@ __u64 eventfd_signal(struct eventfd_ctx *ctx, __u64 n)
>  	 * it returns true, the eventfd_signal() call should be deferred to a
>  	 * safe context.
>  	 */
> -	if (WARN_ON_ONCE(this_cpu_read(eventfd_wake_count)))
> +	if (WARN_ON_ONCE(this_cpu_read(eventfd_wake_count) >
> +	    EFD_WAKE_COUNT_MAX))
>  		return 0;
>  
>  	spin_lock_irqsave(&ctx->wqh.lock, flags);
> diff --git a/include/linux/eventfd.h b/include/linux/eventfd.h
> index fa0a524baed0..74be152ebe87 100644
> --- a/include/linux/eventfd.h
> +++ b/include/linux/eventfd.h
> @@ -29,6 +29,9 @@
>  #define EFD_SHARED_FCNTL_FLAGS (O_CLOEXEC | O_NONBLOCK)
>  #define EFD_FLAGS_SET (EFD_SHARED_FCNTL_FLAGS | EFD_SEMAPHORE)
>  
> +/* This is the maximum recursion depth we find so far */
> +#define EFD_WAKE_COUNT_MAX 1
> +
>  struct eventfd_ctx;
>  struct file;
>  
> @@ -47,7 +50,7 @@ DECLARE_PER_CPU(int, eventfd_wake_count);
>  
>  static inline bool eventfd_signal_count(void)
>  {
> -	return this_cpu_read(eventfd_wake_count);
> +	return this_cpu_read(eventfd_wake_count) > EFD_WAKE_COUNT_MAX;
>  }
>  
>  #else /* CONFIG_EVENTFD */
> -- 
> 2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
